require 'spec_helper'

describe GrapeVersioningExample::Endpoints::AvailableFoos do

  it "expects some OLD foo" do 
    with_api GrapeVersioningExample::Application do
      get_request(path: "/api/available_foos", head: { "accept" => 'application/vnd.available_foos-v1+json'}) do |async|
        expect( async.response ).to include("OLD FOO")
      end
    end
  end

  it "expects some OLD foo" do 
    with_api GrapeVersioningExample::Application do
      get_request(path: "/api/available_foos", head: { "accept" => 'application/vnd.available_foos-v2+json'}) do |async|
        expect( async.response ).to include("NEW FOO")
      end
    end
  end

end
