module Mackerel
  module Commands
    class Tsdb < Thor
      desc 'latest [option]', 'Show latest TSDB'
      option "hostId", type: :array, desc: 'host ID, multiple assignments possible'
      option "name",   type: :array, desc: 'metric name, multiple assignments possible'
      def latest
        puts JSON.pretty_generate Mackerel.latest_tsdb(options)
      end
    end
  end
end
