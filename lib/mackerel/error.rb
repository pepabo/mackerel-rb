module Mackerel
  class Error < StandardError
    attr_reader :response

    def self.from_response(response)
      status = response.status.to_i

      klass = case status
              when 400      then BadRequest
              when 400..499 then ClientError
              when 500      then InternalServerError
              when 500..599 then ServerError
              end

      klass.new(response) if klass
    end

    def initialize(response)
      @response = response
      super(build_error_message)
    end

    private

    def build_error_message
      return nil if @response.nil?

      message =  "#{@response.method.to_s.upcase} "
      message << "#{@response.url.to_s}: "
      message << "#{@response.status}"
      message << " - #{response_error}>" if response_error
      message
    end

    def response_error
      data = @response.body
      data.error if data.respond_to?(:error) && data.error
    end
  end

  class ClientError < Error
  end

  class BadRequest < ClientError
  end

  class ServerError < Error
  end

  class InternalServerError < ServerError
  end
end
