# frozen_string_literal: true

module Harkness
  # The creator resource.
  class CreatorResource < Resource
    # Get a list of creators.
    # @param params [Hash] the params to pass to the API request.
    #   See the [creators documentation from Marvel](https://developer.marvel.com/docs#!/public/getCreatorCollection_get_12)
    #   for valid options.
    # @return [Harkness::CreatorDataWrapper] the top level wrapper around the creator API response.
    # @example
    #   client.creators.list
    #   client.creators.list(firstNameStartsWith: "Ben", limit: 10, orderBy: "lastName")
    def list(**params)
      CreatorDataWrapper.from_json(get_request("creators", params: params).body)
    end

    # Get a single creator.
    # @param creator_id [Integer] the ID of the creator.
    # @return [Harkness::CreatorDataWrapper] the top level wrapper around the creator API response.
    # @example
    #   client.creators.retrieve(creator_id: 1234)
    def retrieve(creator_id:)
      CreatorDataWrapper.from_json(get_request("creators/#{creator_id}").body)
    end

    # Get a list of comics for a particular creator.
    # @param creator_id [Integer] the ID of the creator.
    # @return [Harkness::ComicDataWrapper] the top level wrapper around the comic API response.
    # @example
    #   client.creators.comics(creator_id: 1234)
    def comics(creator_id:)
      ComicDataWrapper.from_json(get_request("creators/#{creator_id}/comics").body)
    end

    # Get a list of events for a particular creator.
    # @param creator_id [Integer] the ID of the creator.
    # @return [Harkness::EventDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.creators.events(creator_id: 1234)
    def events(creator_id:)
      EventDataWrapper.from_json(get_request("creators/#{creator_id}/events").body)
    end

    # Get a list of series for a particular creator.
    # @param creator_id [Integer] the ID of the creator.
    # @return [Harkness::SeriesDataWrapper] the top level wrapper around the series API response.
    # @example
    #   client.creators.series(creator_id: 1234)
    def series(creator_id:)
      SeriesDataWrapper.from_json(get_request("creators/#{creator_id}/series").body)
    end

    # Get a list of stories for a particular creator.
    # @param creator_id [Integer] the ID of the creator.
    # @return [Harkness::StoryDataWrapper] the top level wrapper around the story API response.
    # @example
    #   client.creators.stories(creator_id: 1234)
    def stories(creator_id:)
      StoryDataWrapper.from_json(get_request("creators/#{creator_id}/stories").body)
    end
  end
end
