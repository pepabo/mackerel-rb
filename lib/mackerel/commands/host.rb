require 'mackerel/commands/host_status'

module Mackerel
  module Commands
    class Host < Thor
      desc 'list', 'List hosts'
      option "service", type: :string, desc: 'service name'
      option "role",    type: :array,  desc: 'role names in the service, multiple assignments possible'
      option "name",    type: :string, desc: 'host name'
      option "status",  type: :array,  desc: 'extract host status, multiple assignments possible'
      def list
        puts JSON.pretty_generate Mackerel.hosts(options)
      end

      desc 'show <hostId>', 'Show host'
      def show(id)
        puts JSON.pretty_generate Mackerel.host(id)
      end

      desc 'status <subcommand>', 'Commands about host status control'
      subcommand('status', Commands::HostStatus)

      desc 'retire ID', 'Retire host'
      def retire(id)
        puts JSON.pretty_generate Mackerel.retire_host(id)
      end

      desc 'metrics id', 'Show Host Metrics'
      option "name", type: :string,  required: :true, desc: 'metric name'
      option "from", type: :numeric, required: :true, desc: 'search start epoch time'
      option "to",   type: :numeric, required: :true, desc: 'search end epoch time'
      def metrics(id)
        puts JSON.pretty_generate Mackerel.host_metrics(id, options)
      end
    end
  end
end
