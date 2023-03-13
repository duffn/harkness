# frozen_string_literal: true

module Harkness
  module Error
    # Base Harkness error class.
    class Error < StandardError; end

    # Raised when the API endpoint returns the HTTP status code 400.
    class BadRequest < Error; end

    # Raised when the API endpoint returns the HTTP status code 401.
    class Unauthorized < Error; end

    # Raised when the API endpoint returns the HTTP status code 403.
    class Forbidden < Error; end

    # Raised when the API endpoint returns the HTTP status code 404.
    class NotFound < Error; end

    # Raised when the API endpoint returns the HTTP status code 405.
    class MethodNotAllowed < Error; end

    # Raised when the API endpoint returns the HTTP status code 406.
    class NotAcceptable < Error; end

    # Raised when the API endpoint returns the HTTP status code 409.
    class Conflict < Error; end

    # Raised when the API endpoint returns the HTTP status code 422.
    class Unprocessable < Error; end

    # Raised when the API endpoint returns the HTTP status code 429.
    class TooManyRequests < Error; end

    # Raised when the API endpoint returns the HTTP status code 500.
    class InternalServerError < Error; end

    # Raised when the API endpoint returns the HTTP status code 502.
    class BadGateway < Error; end

    # Raised when the API endpoint returns the HTTP status code 503.
    class ServiceUnavailable < Error; end

    # Raised when the API endpoint returns the HTTP status code 522.
    class ConnectionTimedOut < Error; end

    # HTTP status codes mapped to error classes.
    STATUS_MAPPINGS = {
      400 => BadRequest,
      401 => Unauthorized,
      403 => Forbidden,
      404 => NotFound,
      405 => MethodNotAllowed,
      406 => NotAcceptable,
      409 => Conflict,
      422 => Unprocessable,
      429 => TooManyRequests,
      500 => InternalServerError,
      502 => BadGateway,
      503 => ServiceUnavailable,
      522 => ConnectionTimedOut
    }.freeze
  end
end
