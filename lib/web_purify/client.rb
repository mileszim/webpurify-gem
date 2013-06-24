require_relative 'methods/filters'
require_relative 'methods/blacklist'

class WebPurify::Client
  include WebPurify::Filters
  
  def initialize(options)
    if options.is_a? String
      @api_key = options
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