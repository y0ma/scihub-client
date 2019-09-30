module SciHub
  module API
    class Error < StandardError
      # Raised when Copernicus Scihub API returns a 4xx HTTP status code
      ClientError = Class.new(self)

      # Raised when Copernicus Scihub API returns the HTTP status code 400
      BadRequest = Class.new(ClientError)

      # Raised when Copernicus Scihub API returns the HTTP status code 401
      Unauthorized = Class.new(ClientError)

      # Raised when Copernicus Scihub API returns the HTTP status code 403
      Forbidden = Class.new(ClientError)

      # Raised when Copernicus Scihub API returns the HTTP status code 404
      NotFound = Class.new(ClientError)

      # Raised when Copernicus Scihub API returns the HTTP status code 422
      UnprocessableEntity = Class.new(ClientError)

      # Raised when Copernicus Scihub API returns the HTTP status code 429
      TooManyRequests = Class.new(ClientError)

      # Raised when Copernicus Scihub API returns a 5xx HTTP status code
      ServerError = Class.new(self)

      # Raised when Copernicus Scihub API returns the HTTP status code 500
      InternalServerError = Class.new(ServerError)

      # Raised when Copernicus Scihub API returns the HTTP status code 502
      BadGateway = Class.new(ServerError)

      # Raised when Copernicus Scihub API returns the HTTP status code 503
      ServiceUnavailable = Class.new(ServerError)

      # Raised when Copernicus Scihub API returns the HTTP status code 504
      GatewayTimeout = Class.new(ServerError)

      ERRORS = {
        400 => SciHub::API::Error::BadRequest,
        401 => SciHub::API::Error::Unauthorized,
        403 => SciHub::API::Error::Forbidden,
        404 => SciHub::API::Error::NotFound,
        422 => SciHub::API::Error::UnprocessableEntity,
        429 => SciHub::API::Error::TooManyRequests,
        500 => SciHub::API::Error::InternalServerError,
        502 => SciHub::API::Error::BadGateway,
        503 => SciHub::API::Error::ServiceUnavailable,
        504 => SciHub::API::Error::GatewayTimeout,
      }.freeze

      def self.by_code(code)
        return if code.to_i < 300
        ERRORS[code.to_i] || SciHub::API::Error
      end
    end
  end
end
