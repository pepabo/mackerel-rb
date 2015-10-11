module Mackerel
  class Client
    module Monitor
      def monitors(options = {})
        response = get 'monitors', options
        response.body.monitors
      end
    end
  end
end
