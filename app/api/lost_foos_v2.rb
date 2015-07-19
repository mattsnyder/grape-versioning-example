module GrapeVersioningExample
  module Endpoints
    class LostFoosV2 < Grape::API
      version 'v2', using: :header, vendor: 'lost_foos', strict: true, cascade: true
      content_type :v2_lost_foos,  'application/vnd.lost_foos-v2+json'
      format :v2_lost_foos

      resources :lost_foos do
        get do
          {"foos" => 'NEW FOO'}
        end
      end
    end
  end
end
