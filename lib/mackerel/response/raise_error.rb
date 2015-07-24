require 'faraday'
require 'mackerel/error'

module Mackerel
  module Response
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        error = Mackerel::Error.from_response(response)
        raise error if error
      end
    end
  end
end
