require 'mackerel/configuration'
require 'mackerel/connection'
require 'mackerel/client/dashboard'
require 'mackerel/client/host'
require 'mackerel/client/host_status'
require 'mackerel/client/host_roles'
require 'mackerel/client/tsdb'
require 'mackerel/client/service'
require 'mackerel/client/service_tsdb'
require 'mackerel/client/monitor'
require 'mackerel/client/monitoring_check_report'
require 'mackerel/client/org'
require 'mackerel/client/role'
require 'mackerel/client/alert'
require 'mackerel/client/user'
require 'mackerel/response/raise_error'

module Mackerel
  class Client
    include Configuration
    include Connection

    include Client::Dashboard
    include Client::Host
    include Client::HostStatus
    include Client::HostRoles
    include Client::Monitor
    include Client::MonitoringCheckReport
    include Client::Org
    include Client::Tsdb
    include Client::Service
    include Client::ServiceTsdb
    include Client::Role
    include Client::Alert
    include Client::User
  end
end
