module WebPurify
  
  # WebPurify::Filters
  #
  # Handles methods related to determining/filtering profane text
  module Filters
    
    # Check for existence of profanity
    #
    # @param  text    [String]  Text to test for profanity
    # @param  options [Hash]    Options hash, used to set additional parameters
    # @return         [Boolean] True if text contains profanity, false if not
    def check(text, options={})
      params = {
        :method => WebPurify::Constants.methods[:check],
        :text   => text
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params.merge(options))
      return parsed[:found]=='1'
    end


    # Check for existence of profanity and return number of profane words found
    #
    # @param  text    [String]  Text to test for profanity
    # @param  options [Hash]    Options hash, used to set additional parameters
    # @return         [Integer] The number of profane words found in text 
    def check_count(text, options={})
      params = {
        :method => WebPurify::Constants.methods[:check_count],
        :text   => text
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params.merge(options))
      return parsed[:found].to_i
    end


    # Replace any matched profanity with provided symbol
    #
    # @param  text    [String]  Text to test for profanity
    # @param  symbol  [String]  The symbol to replace each character of matched profanity
    # @param  options [Hash]    Options hash, used to set additional parameters
    # @return         [String]  The original text, replaced with the provided symbol
    def replace(text, symbol, options={})
      params = {
        :method => WebPurify::Constants.methods[:replace],
        :text   => text,
        :replacesymbol => symbol
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params.merge(options))
      return parsed[:text]
    end
    
    
    # Return an array of matched profanity
    #
    # @param  text    [String]  Text to test for profanity
    # @param  options [Hash]    Options hash, used to set additional parameters
    # @return         [Array]   The array of matched profane words
    def return(text, options={})
      params = {
        :method => WebPurify::Constants.methods[:return],
        :text   => text
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params.merge(options))
      if parsed[:expletive].is_a?(String)
        return [] << parsed[:expletive]
      else
        return parsed.fetch(:expletive, [])
      end
    end


    # Check for existence of prohibited image content
    #
    # @param  imgurl  [String] URL of the image to be moderated
    # @param  options [Hash]   Options hash, used to set additional parameters
    # @return         [String] Image ID that is used to return results to the callback function
    def imgcheck(imgurl, options={})
      params = {
        :method => WebPurify::Constants.methods[:imgcheck],
        :imgurl => imgurl
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params.merge(options))
      return parsed[:imgid]
    end
    
  end
end