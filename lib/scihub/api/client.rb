require 'scihub/api/utils'

module SciHub
  module API
    class Client
      include SciHub::API::Utils

      BASE_URL = 'https://scihub.copernicus.eu/dhus/'.freeze

      attr_reader :login, :password

      def initialize(options = {})
        @login = options[:login]
        @password = options[:password]
      end

      def base_url
        BASE_URL
      end

      def search(options = {})
        options[:q] = '*' unless options[:q]
        options[:format] = :json unless options[:format]

        perform_get('search', params: options)
      end

      def product(uuid)
        perform_get("Products('#{uuid}')")
      end
    end
  end
end
