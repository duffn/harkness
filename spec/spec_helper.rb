# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

if ENV.fetch("CI", nil)
  require "simplecov-cobertura"
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
end

require "harkness"
require "vcr"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.configure_rspec_metadata!
  c.hook_into :webmock
  c.filter_sensitive_data("abcd") { ENV["MARVEL_PUBLIC_KEY"] }
  c.before_record do |i|
    i.response.body.force_encoding("UTF-8")
  end
  c.debug_logger
end
