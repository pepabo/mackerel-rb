module Mackerel
  class Client
    module Host
      def hosts(options = {})
        response = get 'hosts.json', options
        response.body.hosts
      end

      def host(id)
        response = get "hosts/#{id}"
        response.body.host
      end

      def create_host(params)
        response = post "hosts", params
        response.body.host
      end

      def update_host(id, params)
        response = put "hosts/#{id}", params
        response.body
      end

      def retire_host(id)
        response = post "hosts/#{id}/retire"
        response.body
      end

      def host_metrics(id, params)
        response = get "hosts/#{id}/metrics", params
        response.body
      end

      def host_metric_names(id)
        response = get "hosts/#{id}/metric-names"
        response.body.names
      end
    end
  end
end
