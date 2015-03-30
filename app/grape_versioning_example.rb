module GrapeVersioningExample
  class Application < Goliath::API
    def response(env)
      ::GrapeVersioningExample::API.call(env)      
    end
  end
end
