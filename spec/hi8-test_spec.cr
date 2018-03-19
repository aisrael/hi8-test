require "http/client"
require "./spec_helper"

describe Hi8::Test do
  it "demonstrates the issue" do
    HI8.use_cassette("multiple_calls") do
      get1 = HTTP::Client.get "http://localhost:3000/api?key=test"
      get1.body.lines.first.should eq("value")
      headers = HTTP::Headers.new
      headers["Content-Type"] = "application/json"
      body = {
        test: "new value"
      }.to_json
      post = HTTP::Client.post "http://localhost:3000/api?key=test", headers, body
      post.status_code.should eq(200)
      get2 = HTTP::Client.get "http://localhost:3000/api?key=test"
      get2.body.lines.first.should eq("new value")
    end
  end
end
