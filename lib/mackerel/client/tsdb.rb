module Mackerel
  class Client
    module Tsdb
      def latest_tsdb(params)
        response = get 'tsdb/latest', params
        response.body.tsdbLatest
      end
    end
  end
end
