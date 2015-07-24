require 'hashie'
require 'faraday'
require 'faraday_middleware'

module Mackerel
  module Connection
    def get(url, params = {})
      connection.get(url, params)
    end

    def post(url, params = {})
      connection.post(url) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end
    end

    def request(method, url, params = {})
      connection.send(method, url, params)
    end

    def connection
      @connection ||= Faraday.new(url: config.api_endpoint, headers: config.http_request_headers, request: config.request) do |faraday|
        faraday.use Mackerel::Response::RaiseError
        faraday.use Faraday::Response::Logger if ENV['DEBUG'] == '1'
        faraday.use FaradayMiddleware::Mashify
        faraday.use FaradayMiddleware::ParseJson
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
