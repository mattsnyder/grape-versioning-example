module GrapeVersioningExample
  module Endpoints
    class PingV1 < Grape::API
      version 'v1', using: :header, vendor: 'mattsnyder.ping', cascade: true
      content_type :v1_ping,  'application/vnd.mattsnyder.ping-v1+json'
      format :v1_ping

      resources :example do
        get '/ping' do
          { ping: "version 1" }
        end
      end
    end
  end
end
