require_relative 'methods/filters'
require_relative 'methods/blacklist'
require_relative 'methods/whitelist'

# WebPurify::Client
#
# The WebPurify::Client class maintains state of the request parameters like api_key, endpoint, etc.,
# and provides easy methods for accessing WebPurify
class WebPurify::Client
  include WebPurify::Filters
  include WebPurify::Blacklist
  include WebPurify::Whitelist
  
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
      :host   => WebPurify::Constants.endpoints[@endpoint],
      :path   => WebPurify::Constants.rest_path,
      :scheme => WebPurify::Constants.scheme(@enterprise)
    }

    @query_base = {
      :api_key => @api_key,
      :format  => WebPurify::Constants.format
    }
  end
end