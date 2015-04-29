module WebPurify
  
  # WebPurify::ImageFilters
  #
  # Handles methods related to determining/filtering prohibited image content
  module ImageFilters
    
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
      parsed = WebPurify::Request.query(image_request_base, @query_base, params.merge(options))
      return parsed[:imgid]
    end


    # Return status of image moderation
    #
    # @param  imgid   [String] ID of the image being moderated
    # @param  options [Hash]   Options hash, used to set additional parameters
    # @return         [String] Status of image moderation
    def imgstatus(imgid, options={})
      params = {
        :method => WebPurify::Constants.methods[:imgstatus],
        :imgid  => imgid
      }
      parsed = WebPurify::Request.query(image_request_base, @query_base, params.merge(options))
      return parsed[:status]
    end


    # Return number of image submissions remaining on license
    #
    # @return [Integer] Number of image submissions remaining
    def imgaccount
      params = {
        :method => WebPurify::Constants.methods[:imgaccount]
      }
      parsed = WebPurify::Request.query(image_request_base, @query_base, params)
      return parsed[:remaining].to_i
    end
    
  end
end