# frozen_string_literal: true

require "digest/md5"

module Harkness
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, authentication_params.merge(params), headers)
    end

    def authentication_params
      timestamp = Time.now.to_i
      {
        ts: timestamp,
        apikey: @client.public_key,
        hash: Digest::MD5.hexdigest(timestamp.to_s + @client.private_key + @client.public_key)
      }
    end

    def handle_response(response)
      error_klass = Harkness::Error::STATUS_MAPPINGS[response.status]
      message = JSON.parse(response.body)["status"] || "API request failed with an unknown error."
      raise error_klass, message if error_klass

      response
    end
  end
end
