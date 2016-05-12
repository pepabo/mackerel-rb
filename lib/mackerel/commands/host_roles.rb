module Mackerel
  module Commands
    class HostRoles < Thor
      namespace 'host roles'

      desc 'update <hostId> --roleFullnames=<roleFullnames>[ <roleFullnames> ...]', 'Update host roles'
      option 'roleFullnames', type: :array, required: true, desc: 'host roles'
      def update(id)
        puts JSON.pretty_generate Mackerel.update_host_roles(id, options)
      end
    end
  end
end

