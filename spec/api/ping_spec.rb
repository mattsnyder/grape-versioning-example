require 'spec_helper'

describe GrapeVersioningExample::Endpoints::PingV1 do
  it "GET /ping(version 1)" do
    with_api GrapeVersioningExample::Application do
      get_request(path: "/api/example/ping", head: { "accept" => 'application/vnd.mattsnyder.ping-v1+json'}) do |async|
        expect( async.response_header['CONTENT_TYPE'] ).to eq("application/vnd.mattsnyder.ping-v1+json")
        expect( async.response ).to include("version 1")
      end
    end
  end
end

describe GrapeVersioningExample::Endpoints::PingV2 do
  it "GET /ping(version 2)" do
    with_api GrapeVersioningExample::Application do
      get_request(path: "/api/example/ping", head: { "accept" => 'application/vnd.mattsnyder.ping-v2+json'}) do |async|
        expect( async.response_header['CONTENT_TYPE'] ).to eq("application/vnd.mattsnyder.ping-v2+json")
        expect( async.response ).to include("version 2")
      end
    end
  end
end
