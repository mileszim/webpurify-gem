require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = File.join("spec", "fixtures", "vcr")
  c.hook_into :webmock
  c.filter_sensitive_data("<WEBPURIFY_API_KEY>") { ENV["WEBPURIFY_API_KEY"] }
end

# This wraps RSpec examples with vcr: true in a VCR#use_cassette block and creates
# a cassette using the name of the example the first time an HTTP request is made.
module VcrHelper
  def with_vcr_cassette example, name = nil, options = {}, &block
    name ||= default_cassette_name_for_example(example)
    VCR.use_cassette name, options, &block
  end

  def default_cassette_name_for_example(example)
    example.full_description.sub(/\s/, '/').sub('#', '/').gsub(/[^\w\/]+/, "_")
  end
end

RSpec.configuration.include VcrHelper, vcr: true

RSpec.configure do |config|
  config.around(:each, vcr: true) do |example|
    with_vcr_cassette(example) do
      example.call
    end
  end
end