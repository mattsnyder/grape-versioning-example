require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

require 'rspec/core'
require 'rspec/core/rake_task'
require './lib/tasks/neo4j'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec) 

task :environment do
  require File.expand_path("../config/environment", __FILE__)
end

namespace :db do
  def neo
    @neo ||= Neo4j::Session.open(:server_db, AppConfigs.host, basic_auth: { username: AppConfigs.username, password: AppConfigs.password})
    Neo4j::Session.current
  end

  def find_or_create(klass, attrs={})
    match = klass.where(attrs).first
    return match if match

    klass.create attrs
  end

  def find_device(json)
    device = Device.where(name: json["name"]).first
    return device if device

    device = Device.create(name: json["name"])
    form   = FormFactor.where(name: json["form_factor"]).first
    os     = OperatingSystem.where(name: json["operating_system"]).first
    form ||= FormFactor.create(name: json["form_factor"])
    os   ||= OperatingSystem.create(name: json["operating_system"])

    os.operates << device
    form.devices << device
    device
  end
  

  desc "Seed database from Orders App using the SMART API"
  task :seed => :environment do
    require 'neo4j'
    require 'excon'
    require './app/models/tester'

    ids = JSON.parse Excon.get("http://localhost:3000/smart/export", headers: { 'Accept' => 'application/json'}).body
    
    ids.reject{|val| val.to_s.strip.length == 0}.each do |id|
      puts id
      response = Excon.get("http://localhost:3000/smart/export?id=#{id}", headers: { 'Accept' => 'application/vnd.usertesting.tester-v1+json'})
      next if response.status != 200
      tester_json = JSON.parse(response.body)


      tester = Tester.where(user_id: id).first
      begin
        tester ||= Tester.create( 
          user_id: tester_json["id"],
          username: tester_json["username"],
          gender: tester_json["gender"].titleize,
          birth_year: tester_json["birth_year"],
          msr: tester_json["msr"]
        )
      rescue StandardError => caught
        puts "*"*30
        puts "Could not create User(json: #{tester_json}) due to :#{caught.message}"
        puts "*"*30
        next
      end

      tester.expertise = find_or_create Expertise, description: tester_json["expertise"]

      if tester_json["country"]
        tester.resides_in = find_or_create Country, name: tester_json["country"]
      end

      tester_json["devices"].each do |d|
        device = find_device(d)
        tester.owns << device
      end

      tester_json["gaming_genres"].each do |d|
        tester.plays << find_or_create(GamingGenre, name: d)
      end

      tester_json["web_browsers"].each do |b|
        tester.browses_with << find_or_create(WebBrowser, name: b)
      end

      tester_json["social_networks"].each do |b|
        tester.uses << find_or_create(SocialNetwork, name: b)
      end

      # tester.earns = find_or_create(IncomeRange, minimum: tester_json["min_income_in_thousands"], maximum: tester_json["max_income_in_thousands"])
      tester.minimum_income_in_thousands = tester_json["min_income_in_thousands"]
      tester.maximum_income_in_thousands = tester_json["max_income_in_thousands"]
      tester.save

      puts tester.attributes
    end
  end
end


desc "Show all routes"
task :routes => :environment do
  Census::API.routes.each do |route|
    p route
  end
end
