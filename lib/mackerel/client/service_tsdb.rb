module Mackerel
  class Client
    module ServiceTsdb
      def create_service_tsdb(service_name, params)
        response = post "service/#{service_name}/tsdb", params
        response.body
      end
      alias :create_service_metrics :create_service_tsdb
    end
  end
end
