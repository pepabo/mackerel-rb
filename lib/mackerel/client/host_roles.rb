module Mackerel
  class Client
    module HostRoles
      def update_host_roles(id, options)
        response = put "hosts/#{id}/role-fullnames", options
        response.body
      end
    end
  end
end

