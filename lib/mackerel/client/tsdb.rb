module Mackerel
  class Client
    module Tsdb
      def create_tsdb(params)
        response = post 'tsdb', params
        response.body
      end
      alias :create_metrics :create_tsdb

      def latest_tsdb(params)
        response = get 'tsdb/latest', params
        response.body.tsdbLatest
      end
      alias :latest_metrics :latest_tsdb
    end
  end
end
