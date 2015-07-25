module Mackerel
  class Client
    module Tsdb
      def create_tsdb(params)
        response = post 'tsdb', params
        response.body
      end

      def latest_tsdb(params)
        response = get 'tsdb/latest', params
        response.body.tsdbLatest
      end
    end
  end
end
