# frozen_string_literal: true

module Harkness
  # The comic resource.
  class ComicResource < Resource
    # Get a list of comics.
    # @param params [Hash] the params to pass to the API request.
    #   See the [comics documentation from Marvel](https://developer.marvel.com/docs#!/public/getComicsCollection_get_6)
    #   for valid options.
    # @return [Harkness::ComicDataWrapper] the top level wrapper around the comic API response.
    # @example
    #   client.comics.list
    #   client.comics.list(titleStartsWith: "Spider", limit: 10, orderBy: "issueNumber")
    def list(**params)
      ComicDataWrapper.from_json(get_request("comics", params: params).body)
    end

    # Get a single comic.
    # @param comic_id [Integer] the ID of the comic.
    # @return [Harkness::ComicDataWrapper] the top level wrapper around the comic API response.
    # @example
    #   client.comics.retrieve(comic_id: 1234)
    def retrieve(comic_id:)
      ComicDataWrapper.from_json(get_request("comics/#{comic_id}").body)
    end

    # Get a list of characters for a particular comic.
    # @param comic_id [Integer] the ID of the comic.
    # @return [Harkness::CharacterDataWrapper] the top level wrapper around the character API response.
    # @example
    #   client.comics.characters(comic_id: 1234)
    def characters(comic_id:)
      CharacterDataWrapper.from_json(get_request("comics/#{comic_id}/characters").body)
    end

    # Get a list of creators for a particular comic.
    # @param comic_id [Integer] the ID of the comic.
    # @return [Harkness::CreatorDataWrapper] the top level wrapper around the creator API response.
    # @example
    #   client.comics.creators(comic_id: 1234)
    def creators(comic_id:)
      CreatorDataWrapper.from_json(get_request("comics/#{comic_id}/creators").body)
    end

    # Get a list of events for a particular comic.
    # @param comic_id [Integer] the ID of the comic.
    # @return [Harkness::EventDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.comics.events(comic_id: 1234)
    def events(comic_id:)
      EventDataWrapper.from_json(get_request("comics/#{comic_id}/events").body)
    end

    # Get a list of stories for a particular comic.
    # @param comic_id [Integer] the ID of the comic.
    # @return [Harkness::StoryDataWrapper] the top level wrapper around the story API response.
    # @example
    #   client.comics.stories(comic_id: 1234)
    def stories(comic_id:)
      StoryDataWrapper.from_json(get_request("comics/#{comic_id}/stories").body)
    end
  end
end
