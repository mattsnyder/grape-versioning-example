# -*- coding: utf-8 -*-
module GrapeVersioningExample
  module Endpoints
    class AvailableFoos < Grape::API
      version :v1, using: :header, vendor: 'available_foos', strict: true, cascade: false do 
        content_type :v1_available_foos,  'application/vnd.available_foos-v1+json'
        # formatter :v1_available_foos,  lambda { |object, env| object }
        format :v1_available_foos

        resources :available_foos do

          params do
          end
          get do
            [{"foos" => 'OLD FOO'}]
          end

        end
      end

      version :v2, using: :header, vendor: 'available_foos', strict: true, cascade: true do 
        content_type :v2_available_foos,  'application/vnd.available_foos-v2+json'
        # formatter :v2_available_foos,  lambda { |object, env| object }
        format :v2_available_foos

        resources :available_foos do
 
          params do
          end
          get do
            [{"foos" => 'NEW FOO'}]
          end

        end
      end

    end
  end
end
