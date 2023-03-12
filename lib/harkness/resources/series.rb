# frozen_string_literal: true

module Harkness
  # The series resource.
  class SeriesResource < Resource
    # Get a list of series.
    # @param params [Hash] the params to pass to the API request.
    #   See the [series documentation from Marvel](https://developer.marvel.com/docs#!/public/getCreatorCollection_get_12)
    #   for valid options.
    # @return [Harkness::SeriesDataWrapper] the top level wrapper around the series API response.
    # @example
    #   client.series.list
    #   client.series.list(titleStartsWith: "Ant-", limit: 10, orderBy: "title")
    def list(**params)
      SeriesDataWrapper.from_json(get_request("series", params: params).body)
    end

    # Get a single series.
    # @param series_id [Integer] the ID of the series.
    # @return [Harkness::SeriesDataWrapper] the top level wrapper around the series API response.
    # @example
    #   client.series.retrieve(series_id: 1234)
    def retrieve(series_id:)
      SeriesDataWrapper.from_json(get_request("series/#{series_id}").body)
    end

    # Get a list of comics for a particular series.
    # @param series_id [Integer] the ID of the series.
    # @return [Harkness::ComicDataWrapper] the top level wrapper around the comic API response.
    # @example
    #   client.series.comics(series_id: 1234)
    def comics(series_id:)
      ComicDataWrapper.from_json(get_request("series/#{series_id}/comics").body)
    end

    # Get a list of stories for a particular series.
    # @param series_id [Integer] the ID of the series.
    # @return [Harkness::StoryDataWrapper] the top level wrapper around the story API response.
    # @example
    #   client.series.stories(series_id: 1234)
    def stories(series_id:)
      StoryDataWrapper.from_json(get_request("series/#{series_id}/stories").body)
    end

    # Get a list of characters for a particular series.
    # @param series_id [Integer] the ID of the series.
    # @return [Harkness::CharacterDataWrapper] the top level wrapper around the character API response.
    # @example
    #   client.series.characters(series_id: 1234)
    def characters(series_id:)
      CharacterDataWrapper.from_json(get_request("series/#{series_id}/characters").body)
    end

    # Get a list of creators for a particular series.
    # @param series_id [Integer] the ID of the series.
    # @return [Harkness::CreatorDataWrapper] the top level wrapper around the creator API response.
    # @example
    #   client.series.creators(series_id: 1234)
    def creators(series_id:)
      CreatorDataWrapper.from_json(get_request("series/#{series_id}/creators").body)
    end

    # Get a list of events for a particular series.
    # @param series_id [Integer] the ID of the series.
    # @return [Harkness::EventDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.series.events(series_id: 1234)
    def events(series_id:)
      EventDataWrapper.from_json(get_request("series/#{series_id}/events").body)
    end
  end
end
