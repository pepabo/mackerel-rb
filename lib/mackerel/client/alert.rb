module Mackerel
  class Client
    module Alert
      def alerts(options = {})
        response = get 'alerts', options
        response.body.alerts
      end

      def close_alert(id, params)
        response = post "alerts/#{id}/close", params
        response.body
      end
    end
  end
end
