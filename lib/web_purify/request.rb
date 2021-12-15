require 'uri'
require 'open-uri'
require 'json'

module WebPurify

  # WebPurify::Request
  #
  # WebPurify::Request handles the HTTP/HTTPS queries to the API endpoints,
  # converting returned JSON into a usable object.
  module Request

    WRAPPER = :rsp

    class RequestError < StandardError
      attr_accessor :code, :msg

      def initialize code, msg
        @code = code
        @msg = msg
      end

      def to_s
        "[#{@code}] #{@msg}"
      end
    end


    # Converts a hash of key/values into a url-ready query string
    #
    # @param hash [Hash] The hash to be converted
    # @return [String] The formatted query string
    def self.to_query(hash)
      return URI.encode_www_form(hash)
    end


    # TODO: Request handling can be dramatically simplified using 'open-uri'
    #
    # Executes a query to the API endpoint
    #
    # @param request_base [Hash] The base parameters for the request (comes from WebPurify::Client initialize())
    # @param query_base   [Hash] The base parameters for the query (api_key, format)
    # @param params       [Hash] The unique query parameters
    # @return             [Hash] A hash parsed from the JSON response
    def self.query(request_base, query_base, params)
      q = query_base.merge(params)
      uri_builder = (request_base[:scheme]=='https') ? URI::HTTPS : URI::HTTP
      uri = uri_builder.build(
        :host  => request_base[:host],
        :path  => request_base[:path],
        :query => WebPurify::Request.to_query(q)
      )
      res = JSON.parse(WebPurify::Request.get(uri), :symbolize_names => true)[WRAPPER]
      if res[:err]
        err_attrs = res[:err][:@attributes]
        raise RequestError.new(err_attrs[:code], err_attrs[:msg])
      else
        res
      end
    end


    # Handles making the query according to http or https scheme
    #
    # @param uri    [String] The uri to be queried
    # @return       [String] The JSON request response
    def self.get(uri)
      URI.parse(uri.to_s).read
    end
  end
end
