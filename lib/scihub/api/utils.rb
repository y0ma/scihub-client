require 'scihub/api/request'

module SciHub
  module API
    module Utils
      private

      def request_klass
        SciHub::API::Request
      end

      def perform_get(path, options = {})
        perform_request(:get, path, options)
      end

      def perform_request(request_method, path, options = {})
        request_klass.new(self, request_method, path, options).perform
      end
    end
  end
end
