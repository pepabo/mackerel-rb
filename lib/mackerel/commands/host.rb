require 'mackerel/commands/host_status'

module Mackerel
  module Commands
    class Host < Thor
      desc 'list', 'List hosts'
      option "service", type: :string
      option "role",    type: :array
      option "name",    type: :string
      option "status",  type: :array
      def list
        puts JSON.pretty_generate Mackerel.hosts(options)
      end

      desc 'show ID', 'Show host'
      def show(id)
        puts JSON.pretty_generate Mackerel.host(id)
      end

      desc 'status [COMMAND]', 'Commands about host status control'
      subcommand('status', Commands::HostStatus)

      desc 'retire ID', 'Retire host'
      def retire(id)
        puts JSON.pretty_generate Mackerel.retire_host(id)
      end
    end
  end
end
