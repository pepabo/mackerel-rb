module Mackerel
  class Client
    module Dashboard
      def dashboards(options = {})
        response = get 'dashboards', options
        response.body.dashboards
      end

      def dashboard(id)
        response = get "dashboards/#{id}"
        response.body
      end
    end
  end
end
