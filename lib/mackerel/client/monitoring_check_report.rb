module Mackerel
  class Client
    module MonitoringCheckReport
      def create_monitoring_check_report(params)
        response = post 'monitoring/checks/report', params
        response.body
      end
    end
  end
end
