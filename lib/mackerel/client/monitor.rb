module Mackerel
  class Client
    module Monitor
      def monitors(options = {})
        response = get 'monitors', options
        response.body.monitors
      end

      def monitor(id)
        response = get "monitors/#{id}"
        response.body.monitor
      end
    end
  end
end
