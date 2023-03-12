# frozen_string_literal: true

module Harkness
  # The character resource.
  class CharacterResource < Resource
    # Get a list of characters.
    # @param params [Hash] the params to pass to the API request.
    #   See the [characters documentation from Marvel](https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0)
    #   for valid options.
    # @return [Harkness::CharacterDataWrapper] the top level wrapper around the character API response.
    # @example
    #   client.characters.list
    #   client.characters.list(nameStartsWith: "Ant-", limit: 10, orderBy: "-modified")
    def list(**params)
      CharacterDataWrapper.from_json(get_request("characters", params: params).body)
    end

    # Get a single character.
    # @param character_id [Integer] the ID of the character.
    # @return [Harkness::CharacterDataWrapper] the top level wrapper around the character API response.
    # @example
    #   client.characters.retrieve(character_id: 1234)
    def retrieve(character_id:)
      CharacterDataWrapper.from_json(get_request("characters/#{character_id}").body)
    end

    # Get a list of comics for a particular character.
    # @param character_id [Integer] the ID of the character.
    # @return [Harkness::ComicDataWrapper] the top level wrapper around the comic API response.
    # @example
    #   client.characters.comics(character_id: 1234)
    def comics(character_id:)
      ComicDataWrapper.from_json(get_request("characters/#{character_id}/comics").body)
    end

    # Get a list of events for a particular character.
    # @param character_id [Integer] the ID of the character.
    # @return [Harkness::EventDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.characters.events(character_id: 1234)
    def events(character_id:)
      EventDataWrapper.from_json(get_request("characters/#{character_id}/events").body)
    end

    # Get a list of series for a particular character.
    # @param character_id [Integer] the ID of the character.
    # @return [Harkness::SeriesDataWrapper] the top level wrapper around the series API response.
    # @example
    #   client.characters.series(character_id: 1234)
    def series(character_id:)
      SeriesDataWrapper.from_json(get_request("characters/#{character_id}/series").body)
    end

    # Get a list of stories for a particular character.
    # @param character_id [Integer] the ID of the character.
    # @return [Harkness::StoryDataWrapper] the top level wrapper around the story API response.
    # @example
    #   client.stories.characters(character_id: 1234)
    def stories(character_id:)
      StoryDataWrapper.from_json(get_request("characters/#{character_id}/stories").body)
    end
  end
end
