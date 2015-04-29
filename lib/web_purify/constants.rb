module WebPurify
  
  # WebPurify::Constants
  #
  # WebPurify::Constants holds all the static variables used to access the API.
  module Constants

    # The endpoints for the text moderation service
    #
    # @return [Hash] A hash of endpoints
    def self.text_endpoints
      return {
        :us => 'api1.webpurify.com',
        :eu => 'api1-eu.webpurify.com',
        :ap => 'api1-ap.webpurify.com'
      }
    end


    # The endpoint for the image moderation service
    #
    # @return [String] The endpoint
    def self.image_endpoint
      return 'im-api1.webpurify.com'
    end


    # Path appended to the endpoint URI
    #
    # @return [String] The rest path
    def self.rest_path
      return '/services/rest/'
    end
    
    
    # The response format
    #
    # @return [String] The format
    def self.format
      return 'json'
    end
    
    
    # Returns either http or https depending on whether enterprise mode
    #   is selected.
    #
    # @param enterprise [Boolean] True if enterprise mode, false if not
    # @return [String] The scheme, either http or https
    def self.scheme(enterprise)
      return enterprise ? 'https' : 'http'
    end
    
    
    # A hash for each API method
    #
    # @return [Hash] The method hash
    def self.methods
      return {
        :check                 => 'webpurify.live.check',
        :check_count           => 'webpurify.live.checkcount',
        :replace               => 'webpurify.live.replace',
        :return                => 'webpurify.live.return',
        :add_to_blacklist      => 'webpurify.live.addtoblacklist',
        :add_to_whitelist      => 'webpurify.live.addtowhitelist',
        :remove_from_blacklist => 'webpurify.live.removefromblacklist',
        :remove_from_whitelist => 'webpurify.live.removefromwhitelist',
        :get_blacklist         => 'webpurify.live.getblacklist',
        :get_whitelist         => 'webpurify.live.getwhitelist',
        :imgcheck              => 'webpurify.live.imgcheck',
        :imgstatus             => 'webpurify.live.imgstatus',
        :imgaccount            => 'webpurify.live.imgaccount'
      }
    end

  end
end