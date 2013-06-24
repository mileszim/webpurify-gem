module WebPurify
  module Whitelist
    
    def add_to_whitelist(word)
      params = {
        :method => WebPurify::Constants.methods[:add_to_whitelist],
        :word   => word
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    def remove_from_whitelist(word)
      params = {
        :method => WebPurify::Constants.methods[:remove_from_whitelist],
        :word   => word
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    def get_whitelist
      params = {
        :method => WebPurify::Constants.methods[:get_whitelist]
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      if parsed[:word]
        return [] << parsed[:word]
      else
        return []
      end
    end
    
  end
end