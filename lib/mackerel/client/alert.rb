module Mackerel
  class Client
    module Alert
      def alerts
        response = get 'alerts'
        response.body.alerts
      end

      def close_alert(id, params)
        response = post "alerts/#{id}/close", params
        response.body
      end
    end
  end
end
