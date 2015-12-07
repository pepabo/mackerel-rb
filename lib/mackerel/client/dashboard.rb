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

      def create_dashboard(params)
        response = post 'dashboards', params
        response.body
      end

      def update_dashboard(id, params)
        response = put "dashboards/#{id}", params
        response.body
      end

      def delete_dashboard(id)
        response = delete "dashboards/#{id}"
        response.body
      end
    end
  end
end
