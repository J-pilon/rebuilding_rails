# frozen_string_literal: true

require_relative "lib/r00lz/version"

Gem::Specification.new do |spec|
  spec.name = "r00lz"
  spec.version = R00lz::VERSION
  spec.authors = ["Josiah"]
  spec.email = ["josiah.pilon@gmail.com"]

  spec.summary = "Rebuilding rails"
  spec.description = "Rebuilding rails"
  spec.homepage = "https://github.com/J-pilon/rebuilding_rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/J-pilon/rebuilding_rails"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack", "~> 2.0.7"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
