# -*- coding: utf-8 -*-
module GrapeVersioningExample
  module Endpoints
    class LostFoosV2 < Grape::API
      version :v2, using: :header, vendor: 'lost_foos', strict: true, cascade: true do 
        content_type :lost_foos,  'application/vnd.lost_foos-v2+json'
        formatter :lost_foos,  lambda { |object, env| object }
        format :lost_foos

        resources :lost_foos do
 
          params do
          end
          get do
            [{"foos" => 'new FOO'}]
          end

        end
      end

    end
  end
end
