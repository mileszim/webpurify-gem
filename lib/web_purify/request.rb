require 'uri'
require 'net/http'
require 'net/https'
require 'json'

module WebPurify
  module Request

    WRAPPER = :rsp

    def self.to_query(hash)
      parameters = []
      hash.each {|k,v| parameters << "#{k}=#{v}" }
      return URI.encode(parameters.join("&"))
    end

    def self.query(request_base, query_base, params)
      q = query_base.merge(params)
      uri_builder = (request_base[:scheme]=='https') ? URI::HTTPS : URI::HTTP
      uri = uri_builder.build(
        :host  => request_base[:host],
        :path  => request_base[:path], 
        :query => WebPurify::Request.to_query(q)
      )
      return JSON.parse(WebPurify::Request.get(uri, request_base[:scheme]), :symbolize_names => true)[WRAPPER]
    end

    def self.get(uri, scheme)
      req = (scheme=='https') ? Net::HTTPS : Net::HTTP
      return req.get(uri)
    end

  end
end