require 'typhoeus'
require 'scihub/api/errors'

module SciHub
  module API
    class Request
      def initialize(client, request_method, path, options = {})
        @client = client
        @uri = URI.parse(path)
        @uri = URI.parse(client.base_url) + @uri unless @uri.absolute?
        @request_method = request_method
        @options = options
      end

      def perform
        run
        fail_if_error
        response.response_body
      end

      private

      attr_reader :client, :uri, :request_method, :options
      attr_accessor :response

      def body
        options[:body]&.to_json
      end

      def params
        options[:params]
      end

      def headers
        { 'Content-Type' => 'application/json' }.merge(options[:headers] || {})
      end

      def userpwd
        [client.login, client.password].join(':')
      end

      def run
        self.response = Typhoeus::Request.new(uri, method: request_method, body: body, params: params, headers: headers, userpwd: userpwd).run
      end

      def fail_if_error
        err = SciHub::API::Error.by_code(response.code)
        raise err, response.response_body if err
      end
    end
  end
end
