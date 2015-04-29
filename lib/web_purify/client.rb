require_relative 'methods/text_filters'
require_relative 'methods/blacklist'
require_relative 'methods/whitelist'
require_relative 'methods/image_filters'

# WebPurify::Client
#
# The WebPurify::Client class maintains state of the request parameters like api_key, endpoint, etc.,
# and provides easy methods for accessing WebPurify
class WebPurify::Client
  include WebPurify::TextFilters
  include WebPurify::Blacklist
  include WebPurify::Whitelist
  include WebPurify::ImageFilters
  
  # Initialize the class
  #
  # @param options [String, Hash] Either an API key string, or a hash of options
  def initialize(options)
    if options.is_a? String
      @api_key    = options
      @endpoint   = :us
      @enterprise = false
    elsif options.is_a? Hash
      @api_key    = options[:api_key]
      @endpoint   = options[:endpoint]   || :us
      @enterprise = options[:enterprise] || false
    end

    @request_base = {
      :host   => WebPurify::Constants.text_endpoints.fetch(@endpoint),
      :path   => WebPurify::Constants.rest_path,
      :scheme => WebPurify::Constants.scheme(@enterprise)
    }

    @query_base = {
      :api_key => @api_key,
      :format  => WebPurify::Constants.format
    }
  end

  def text_request_base
    @request_base
  end

  def image_request_base
    @request_base.merge(:host => WebPurify::Constants.image_endpoint)
  end

end