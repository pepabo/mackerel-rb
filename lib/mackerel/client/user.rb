module Mackerel
  class Client
    module User
      def users(options = {})
        response = get 'users', options
        response.body.users
      end

      def delete_user(id)
        response = delete "users/#{id}"
        response.body.user
      end
    end
  end
end
