# -*- coding: utf-8 -*-
module GrapeVersioningExample
  module Endpoints
    class AvailableFoos < Grape::API
      version :v1, using: :header, vendor: 'available_foos', strict: true, cascade: true do 
        content_type :available_sessions,  'application/vnd.available_foos-v1+json'
        formatter :available_sessions,  lambda { |object, env| object.to_json }
        format :available_sessions

        resources :available_foos do

          params do
          end
          get do
            {foos: "OLD FOO"}
          end

        end
      end

      version :v2, using: :header, vendor: 'available_foos', strict: true, cascade: true do 
        content_type :available_sessions,  'application/vnd.available_foos-v2+json'
        formatter :available_sessions,  lambda { |object, env| object.to_json }
        format :available_sessions

        resources :available_foos do
 
          params do
          end
          get do
            {foo: "new FOO"}
          end

        end
      end

    end
  end
end
