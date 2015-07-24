module Mackerel
  module Commands
    class Tsdb < Thor
      desc 'latest', 'Show latest TSDB'
      option "hostId", type: :array
      option "name", type: :array
      def latest
        puts JSON.pretty_generate Mackerel.latest_tsdb(options)
      end
    end
  end
end
