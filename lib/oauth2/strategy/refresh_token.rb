module OAuth2
  module Strategy
    # The Refresh Token Strategy
    #
    # @see https://tools.ietf.org/html/rfc6749#section-6
    class RefreshToken < Base
      # Retrieve an access token given the specified validation code.
      #
      # @param [String] refresh_token The refresh token issued to the client
      # @param [Hash] params additional params
      # @param [Hash] opts options
      def get_token(refresh_token, params = {}, opts = {})
        params = { grant_type: 'refresh_token', refresh_token: refresh_token }.merge(params)

        params.keys.each do |key|
          params[key.to_s] = params.delete(key) if key.is_a?(Symbol)
        end

        @client.get_token(params, opts)
      end
    end
  end
end
