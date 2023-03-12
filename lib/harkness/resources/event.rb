# frozen_string_literal: true

module Harkness
  # The event resource.
  class EventResource < Resource
    # Get a list of events.
    # @param params [Hash] the params to pass to the API request.
    #   See the [events documentation from Marvel](https://developer.marvel.com/docs#!/public/getCreatorCollection_get_12)
    #   for valid options.
    # @return [Harkness::EventDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.events.list
    #   client.events.list(nameStartsWith: "2016", limit: 10, orderBy: "-name")
    def list(**params)
      EventDataWrapper.from_json(get_request("events", params: params).body)
    end

    # Get a single event.
    # @param event_id [Integer] the ID of the event.
    # @return [Harkness::EventDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.events.retrieve(event_id: 1234)
    def retrieve(event_id:)
      EventDataWrapper.from_json(get_request("events/#{event_id}").body)
    end

    # Get a list of comics for a particular event.
    # @param event_id [Integer] the ID of the event.
    # @return [Harkness::ComicDataWrapper] the top level wrapper around the comic API response.
    # @example
    #   client.events.comics(event_id: 1234)
    def comics(event_id:)
      ComicDataWrapper.from_json(get_request("events/#{event_id}/comics").body)
    end

    # Get a list of series for a particular event.
    # @param event_id [Integer] the ID of the event.
    # @return [Harkness::SeriesDataWrapper] the top level wrapper around the series API response.
    # @example
    #   client.events.series(event_id: 1234)
    def series(event_id:)
      SeriesDataWrapper.from_json(get_request("events/#{event_id}/series").body)
    end

    # Get a list of stories for a particular event.
    # @param event_id [Integer] the ID of the event.
    # @return [Harkness::StoryDataWrapper] the top level wrapper around the story API response.
    # @example
    #   client.events.stories(event_id: 1234)
    def stories(event_id:)
      StoryDataWrapper.from_json(get_request("events/#{event_id}/stories").body)
    end

    # Get a list of characters for a particular event.
    # @param event_id [Integer] the ID of the event.
    # @return [Harkness::CharaacterDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.events.characters(event_id: 1234)
    def characters(event_id:)
      CharacterDataWrapper.from_json(get_request("events/#{event_id}/characters").body)
    end

    # Get a list of creators for a particular event.
    # @param event_id [Integer] the ID of the event.
    # @return [Harkness::CreatorDataWrapper] the top level wrapper around the creator API response.
    # @example
    #   client.events.creators(event_id: 1234)
    def creators(event_id:)
      CreatorDataWrapper.from_json(get_request("events/#{event_id}/creators").body)
    end
  end
end
