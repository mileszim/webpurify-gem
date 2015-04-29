module WebPurify
  
  # WebPurify::Blacklist
  #
  # Handles all methods related to the WebPurify Blacklist
  module Blacklist
    
    # Add a word to the blacklist
    #
    # @param  word        [String]  The word to add to the blacklist
    # @param  deep_search [Integer] 1 if deep search on word, otherwise 0 for not (default 0)
    # @return             [Boolean] True if successful, false if not
    def add_to_blacklist(word, deep_search=0)
      params = {
        :method => WebPurify::Constants.methods[:add_to_blacklist],
        :word   => word,
        :ds     => deep_search
      }
      parsed = WebPurify::Request.query(text_request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    
    # Remove a word from the blacklist
    #
    # @param  word  [String]  The word to remove from the blacklist
    # @return       [Boolean] True if successful, false if not
    def remove_from_blacklist(word)
      params = {
        :method => WebPurify::Constants.methods[:remove_from_blacklist],
        :word   => word
      }
      parsed = WebPurify::Request.query(text_request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    
    # Get the blacklist
    #
    # @return [Array] An array of words in the blacklist
    def get_blacklist
      params = {
        :method => WebPurify::Constants.methods[:get_blacklist]
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