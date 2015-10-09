require 'mackerel/configuration'
require 'mackerel/connection'
require 'mackerel/client/dashboard'
require 'mackerel/client/host'
require 'mackerel/client/host_status'
require 'mackerel/client/tsdb'
require 'mackerel/client/service'
require 'mackerel/client/service_tsdb'
require 'mackerel/client/monitoring_check_report'
require 'mackerel/response/raise_error'

module Mackerel
  class Client
    include Configuration
    include Connection

    include Client::Dashboard
    include Client::Host
    include Client::HostStatus
    include Client::Tsdb
    include Client::Service
    include Client::ServiceTsdb
    include Client::MonitoringCheckReport
  end
end
