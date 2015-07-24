module Mackerel
  class Client
    module HostStatus
      def update_host_status(id, options)
        response = post "hosts/#{id}/status", options
        response.body
      end
    end
  end
end
