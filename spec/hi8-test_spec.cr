require "http/client"
require "./spec_helper"

describe Hi8::Test do
  it "demonstrates the issue" do
    HI8.use_cassette("repeated_calls_failing") do
      get1 = HTTP::Client.get "http://localhost:3000"
      get1.body.should eq("1")
      get2 = HTTP::Client.get "http://localhost:3000"
      get2.body.should eq("2")
    end
  end
end
