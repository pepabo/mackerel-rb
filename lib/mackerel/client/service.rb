module Mackerel
  class Client
    module Service
      def services(options = {})
        response = get 'services', options
        response.body.services
      end

      def services_metric_names(service, options = {})
        response = get "services/#{service}/metric-names", options
        response.body.names
      end
    end
  end
end
