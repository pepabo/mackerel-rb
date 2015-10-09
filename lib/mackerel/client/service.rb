module Mackerel
  class Client
    module Service
      def services(options = {})
        response = get 'services', options
        response.body.services
      end
    end
  end
end
