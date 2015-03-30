module GrapeVersioningExample
  module Endpoints
    class LostFoosV1 < Grape::API
      version 'v1', using: :header, vendor: 'lost_foos', strict: true, cascade: true 
      content_type :v1_lost_foos,  'application/vnd.lost_foos-v1+json'
      format :v1_lost_foos

      resources :lost_foos do
        get do
          {"foos" => 'OLD FOO'}
        end
      end
    end
  end
end
