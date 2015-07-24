module Mackerel
  module Commands
    class HostStatus < Thor
      namespace 'host status'

      desc 'update <hostId>', 'Update host status'
      option 'status',  type: :string
      def update(id)
        puts JSON.pretty_generate Mackerel.update_host_status(id, options)
      end
    end
  end
end
