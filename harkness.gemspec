# frozen_string_literal: true

require_relative "lib/harkness/version"

Gem::Specification.new do |spec|
  spec.name = "harkness"
  spec.version = Harkness::VERSION
  spec.authors = ["duffn"]

  spec.summary = "A library for working (playing) with the Marvel API."
  spec.description = "Dive into the Marvel universe with this comprehensive Ruby library for the Marvel API at https://developer.marvel.com."
  spec.homepage = "https://github.com/duffn/harkness"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/duffn/harkness"
  spec.metadata["changelog_uri"] = "https://github.com/duffn/harkness/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.7"
  spec.add_dependency "shale", "~> 0.9.0"

  spec.add_development_dependency "redcarpet", "~> 3.6"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop-rake", "~> 0.6.0"
  spec.add_development_dependency "rubocop-rspec", "~> 2.18"
  spec.add_development_dependency "simplecov", "~> 0.22.0"
  spec.add_development_dependency "simplecov-cobertura", "~> 2.1"
  spec.add_development_dependency "timecop", "~> 0.9.6"
  spec.add_development_dependency "vcr", "~> 6.1"
  spec.add_development_dependency "webmock", "~> 3.18"
  spec.add_development_dependency "yard", "~> 0.9.28"
end
