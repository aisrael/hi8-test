require "kemal"

STORE = {} of String => String

# A simple HTTP server that acts as a key value store
get "/api" do |env|
  key = env.params.query["key"]
  if STORE.has_key?(key)
    STORE[key]
  else
    halt env, status_code: 404
  end
end

post "/api" do |env|
  hash = env.params.json
  hash.each do |key, value|
    STORE[key.to_s] = value.to_s
  end
  200
end

Kemal.run
