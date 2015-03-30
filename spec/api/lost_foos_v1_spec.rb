require 'spec_helper'

describe GrapeVersioningExample::Endpoints::LostFoosV1 do

  it "expects some OLD foo" do 
    with_api GrapeVersioningExample::Application do
      get_request(path: "/api/lost_foos", head: { "accept" => 'application/vnd.lost_foos-v1+json'}) do |async|
        expect( async.response ).to include("OLD FOO")
      end
    end
  end

end
