# frozen_string_literal: true

module Harkness
  class Client
    # The base URL for the Marvel API.
    BASE_URL = "https://gateway.marvel.com/v1/public"

    # The public key for the Marvel API.
    # @return [String] the public key for the Marvel API.
    attr_reader :public_key
    # The private key for the Marvel API.
    # @return [String] the private key for the Marvel API.
    attr_reader :private_key

    # Initialize a client.
    # @param public_key [String] the public key for the Marvel API.
    # @param private_key [String] the private key for the Marvel API.
    # @param logger [Boolean] enable Faraday request logging.
    def initialize(public_key:, private_key:, logger: false)
      @public_key = public_key
      @private_key = private_key
      @logger = logger
    end

    # The character resource.
    # @return [Harkness::CharacterResource] the character resource.
    def characters
      CharacterResource.new(self)
    end

    # The comics resource.
    # @return [Harkness::ComicResource] the comic resource.
    def comics
      ComicResource.new(self)
    end

    # The creators resource.
    # @return [Harkness::CreatorResource] the creator resource.
    def creators
      CreatorResource.new(self)
    end

    # The events resource.
    # @return [Harkness::EventResource] the event resource.
    def events
      EventResource.new(self)
    end

    # The series resource.
    # @return [Harkness::SeriesResource] the series resource.
    def series
      SeriesResource.new(self)
    end

    # The stories resource.
    # @return [Harkness::StoryResource] the story resource.
    def stories
      StoryResource.new(self)
    end

    # The Faraday connection to use for API requests.
    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :json

        conn.response :logger if @logger
      end
    end
  end
end
