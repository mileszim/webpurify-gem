module WebPurify
  
  # WebPurify::Whitelist
  #
  # Handles all methods related to the WebPurify whitelist
  module Whitelist
    
    # Add a word to the whitelist
    #
    # @param  word  [String]  The word to add to the whitelist
    # @return       [Boolean] True if successful, false if not
    def add_to_whitelist(word)
      params = {
        :method => WebPurify::Constants.methods[:add_to_whitelist],
        :word   => word
      }
      parsed = WebPurify::Request.query(text_request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    
    # Remove a word from the whitelist
    #
    # @param  word  [String]  The word to remove from the whitelist
    # @return       [Boolean] True if successful, false if not
    def remove_from_whitelist(word)
      params = {
        :method => WebPurify::Constants.methods[:remove_from_whitelist],
        :word   => word
      }
      parsed = WebPurify::Request.query(text_request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    
    # Get the whitelist
    #
    # @return [Array] An array of words in the whitelist
    def get_whitelist
      params = {
        :method => WebPurify::Constants.methods[:get_whitelist]
      }
      parsed = WebPurify::Request.query(text_request_base, @query_base, params)
      if parsed[:word]
        return [] << parsed[:word]
      else
        return []
      end
    end
    
  end
end