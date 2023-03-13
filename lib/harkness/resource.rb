# frozen_string_literal: true

require "digest/md5"

module Harkness
  # The base resource class.
  class Resource
    # A Harkness client.
    # @return [Harkness::Client] the Harkness client.
    attr_reader :client

    # Initialize a new resource.
    # @param client [Harkness::Client] the Harkness client.
    def initialize(client)
      @client = client
    end

    private

    # Perform a GET request to a URL with params and headers.
    # @param url [String] the URL to send the GET request to.
    # @param params [Hash] URL query parameters to send with the request.
    # @param headers [Hash] headers to send with the request
    # @return [Faraday::Response, Harkness::Error] a Faraday response or Harkness:Error depending
    #   upon the status code.
    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, authentication_params.merge(params), headers)
    end

    # Generate the parameters necessary to authenticate with the Marvel API.
    # See [`authorization`](https://developer.marvel.com/documentation/authorization) in the Marvel API documentation.
    # @return [Hash] the calculated authentication parameters.
    def authentication_params
      timestamp = Time.now.to_i
      {
        ts: timestamp,
        apikey: @client.public_key,
        hash: Digest::MD5.hexdigest(timestamp.to_s + @client.private_key + @client.public_key)
      }
    end

    # Handles a response from the API.
    # @param response [Faraday::Response] the Faraday::Response from the API request.
    # @return [Faraday::Response, Harkness::Error] a Faraday response or Harkness:Error depending
    #   upon the status code.
    def handle_response(response)
      error_klass = Harkness::Error::STATUS_MAPPINGS[response.status]
      message = JSON.parse(response.body)["status"] || "API request failed with an unknown error."
      raise error_klass, message if error_klass

      response
    end
  end
end
