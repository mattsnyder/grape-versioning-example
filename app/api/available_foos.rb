# -*- coding: utf-8 -*-
module GrapeVersioningExample
  module Endpoints
    class AvailableFoos < Grape::API
      version :v1, using: :header, vendor: 'available_foos', strict: true, cascade: true do 
        content_type :available_foos,  'application/vnd.available_foos-v1+json'
        formatter :available_foos,  lambda { |object, env| object }
        format :available_foos

        resources :available_foos do

          params do
          end
          get do
            [{"foos" => 'OLD FOO'}]
          end

        end
      end

      version :v2, using: :header, vendor: 'available_foos', strict: true, cascade: true do 
        content_type :available_foos,  'application/vnd.available_foos-v2+json'
        formatter :available_foos,  lambda { |object, env| object }
        format :available_foos

        resources :available_foos do
 
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
