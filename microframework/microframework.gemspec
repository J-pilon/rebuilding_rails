Gem::Specification.new do |spec|
  spec.name = "microframework"
  spec.version = "0.0.1"
  spec.authors = ["Josiah Pilon"]
  spec.summary = "This is a microframework."
  spec.license = "MIT"
  spec.files = Dir["**/*.rb"]

  spec.add_dependency("rack", "~>2.2")
  spec.add_dependency "webrick"
end
