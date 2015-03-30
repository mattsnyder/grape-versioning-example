require 'rubygems'
require 'securerandom'

ENV["RACK_ENV"] = 'test'

require 'rack/test'

require File.expand_path("../../config/environment", __FILE__)

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
end

require 'goliath/test_helper'
RSpec.configure do |c|
  c.include Goliath::TestHelper, :file_path => /spec\/api/
end
