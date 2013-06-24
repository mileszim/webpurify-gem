module WebPurify
  module Constants

    def self.endpoints
      return {
        :us => 'api1.webpurify.com',
        :eu => 'api1-eu.webpurify.com',
        :ap => 'api1-ap.webpurify.com'
      }
    end

    def self.rest_path
      return '/services/rest/'
    end

    def self.format
      return 'json'
    end

    def self.scheme(enterprise)
      return enterprise ? 'https' : 'http'
    end

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
        :get_whitelist         => 'webpurify.live.getwhitelist'
      }
    end

  end
end