module Mackerel
  module Commands
    class HostStatus < Thor
      namespace 'host status'

      desc 'update <hostId> --status <hostStatus>', 'Update host status'
      option 'status', type: :string, required: true, desc: 'host status'
      def update(id)
        puts JSON.pretty_generate Mackerel.update_host_status(id, options)
      end
    end
  end
end
