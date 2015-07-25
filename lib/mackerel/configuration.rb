module Mackerel
  module Configuration
    def config
      @config ||= Config.new
    end

    def configure
      yield config
    end

    class Config
      attr_accessor :api_endpoint, :api_key, :http_accept, :params_encoder, :proxy, :request, :user_agent

      def initialize
        @api_endpoint   = 'https://mackerel.io/api/v0'
        @api_key        = ENV['MACKEREL_APIKEY']
        @http_accept    = 'application/json'
        @user_agent     = "Mackerel.rb Ruby Gem #{Mackerel::VERSION}"
        @params_encoder = Faraday::FlatParamsEncoder
        @proxy          = nil
      end

      def request
        {
          params_encoder: params_encoder
        }
      end

      def http_request_headers
        headers = {
          'Accept'     => http_accept,
          'User-Agent' => user_agent,
          'X-Api-Key'  => api_key,
        }
        headers.select {|_, v| !!v}
      end
    end
  end
end
