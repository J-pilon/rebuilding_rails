require "microframework"

get "/hello" do
  "Hi!"
end

get "/foo" do
  "Bar"
end

post "/create" do
  "Created!"
end
