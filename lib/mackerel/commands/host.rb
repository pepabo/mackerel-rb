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
    end
  end
end
