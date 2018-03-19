require "hi8"
require "spec"
require "../src/hi8-test"

HI8.configure do |config|
  config.cabinet_shelf = "./test/cassettes"
end
