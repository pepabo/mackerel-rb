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

      def create_host(options)
        response = post "hosts"
        response.body.host
      end

      def update_host(id, options)
        response = put "hosts/#{id}"
        response.body
      end

      def retire_host(id)
        response = post "hosts/#{id}/retire"
        response.body
      end
    end
  end
end
