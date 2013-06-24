module WebPurify
  module Filters
    
    # Check for existence of profanity
    def check(text, *options)
      params = {
        :method => WebPurify::Constants.methods[:check],
        :text   => text
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      return parsed[:found]=='1'
    end


    # Check for existence of profanity and return number of profane words found
    def check_count(text, *options)
      params = {
        :method => WebPurify::Constants.methods[:check_count],
        :text   => text
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      return parsed[:found].to_i
    end


    # Replace any matched profanity with provided symbol
    def replace(text, symbol, *options)
      params = {
        :method => WebPurify::Constants.methods[:replace],
        :text   => text,
        :replacesymbol => symbol
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      return parsed[:text]
    end
    
    
    # Return an array of matched profanity
    def return(text, *options)
      params = {
        :method => WebPurify::Constants.methods[:return],
        :text   => text
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      if parsed[:expletive]
        return [] << parsed[:expletive]
      else
        return []
      end
    end
    
  end
end