module Mackerel
  class Client
    module Org
      def org
        response = get 'org'
        response.body
      end
    end
  end
end
