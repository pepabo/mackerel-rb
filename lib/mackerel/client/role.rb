module Mackerel
  class Client
    module Role
      def roles(service, options = {})
        response = get "services/#{service}/roles", options
        response.body.roles
      end
    end
  end
end
