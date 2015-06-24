module GrapeVersioningExample
  class API < Grape::API
    prefix 'api'

    # Questions
    # cascade on endpoint - is it needed for all versions
    # why are all available_versions not present in grape (Header class)
    # how is mount vs opening classes changing available_versions

    rescue_from :all do |e|
      [ 500, {"Content-Type" => "application/vnd.error+json"}, { error: e.message } ]
    end

    before do
      header 'Access-Control-Allow-Origin', '*'
      header 'Access-Control-Request-Method', '*'
      header 'Access-Control-Allow-Headers', 'Content-type, X-CSRF-Token'
      header 'X-Robots-Tag', 'noindex'
    end

    # rescue_from :all has to be above mount points!
    mount ::GrapeVersioningExample::Endpoints::LostFoosV2
    mount ::GrapeVersioningExample::Endpoints::LostFoosV1
    mount ::GrapeVersioningExample::Endpoints::PingV1
    mount ::GrapeVersioningExample::Endpoints::PingV2
  end
end
