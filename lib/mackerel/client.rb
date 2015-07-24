require 'mackerel/configuration'
require 'mackerel/connection'
require 'mackerel/client/host'
require 'mackerel/client/host_status'
require 'mackerel/client/tsdb'
require 'mackerel/response/raise_error'

module Mackerel
  class Client
    include Configuration
    include Connection

    include Client::Host
    include Client::HostStatus
    include Client::Tsdb
  end
end
