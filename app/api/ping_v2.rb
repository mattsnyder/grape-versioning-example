module GrapeVersioningExample
  module Endpoints
    class PingV2 < Grape::API
      version 'v2', using: :header, vendor: 'mattsnyder.ping', cascade: true
      content_type :v2_ping,  'application/vnd.mattsnyder.ping-v2+json'
      format :v2_ping

      get '/ping' do
        { ping: "version 2" }
      end
    end
  end
end
