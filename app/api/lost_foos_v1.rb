# -*- coding: utf-8 -*-
module GrapeVersioningExample
  module Endpoints
    class LostFoosV1 < Grape::API
      version :v1, using: :header, vendor: 'lost_foos', strict: true, cascade: false 
      content_type :v1_lost_foos,  'application/vnd.lost_foos-v1+json'
      # formatter :v1_lost_foos,  lambda { |object, env| object }
      format :v1_lost_foos

      resources :lost_foos do

        params do
        end
        get do
          [{"foos" => 'OLD FOO'}]
        end

      end

    end
  end
end
