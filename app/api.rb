module GrapeVersioningExample
  class API < Grape::API
    prefix 'api'

    rescue_from :all do |e|
      [ 500, {"Content-Type" => "application/vnd.error+json"}, { error: e.message } ]
    end

    before do
      header 'Access-Control-Allow-Origin', '*'
      header 'Access-Control-Request-Method', '*'
      header 'Access-Control-Allow-Headers', 'Content-type, X-CSRF-Token'
      header 'X-Robots-Tag', 'noindex'
    end

    mount ::GrapeVersioningExample::Endpoints::PingV2
    mount ::GrapeVersioningExample::Endpoints::PingV1
  end
end
