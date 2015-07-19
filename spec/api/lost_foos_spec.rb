require 'spec_helper'

describe GrapeVersioningExample::Endpoints::LostFoosV1 do
  it "GET / (version 1) expects some OLD foo" do 
    with_api GrapeVersioningExample::Application do
      get_request(path: "/api/lost_foos", head: { "accept" => 'application/vnd.lost_foos-v1+json'}) do |async|
        expect( async.response ).to include("OLD FOO")
      end
    end
  end
end

describe GrapeVersioningExample::Endpoints::LostFoosV2 do
  it "GET / (version 2) expects some NEW foo" do 
    with_api GrapeVersioningExample::Application do
      get_request(path: "/api/lost_foos", head: { "accept" => 'application/vnd.lost_foos-v2+json'}) do |async|
        expect( async.response ).to include("NEW FOO")
      end
    end
  end
end
