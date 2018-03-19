require "kemal"

STORE = {} of String => String

value = 0

# A simple HTTP server that increments a value
get "/" do |env|
  value += 1
  value.to_s
end

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
