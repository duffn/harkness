# frozen_string_literal: true

module Harkness
  # The story resource.
  class StoryResource < Resource
    # Get a list of stories.
    # @param params [Hash] the params to pass to the API request.
    #   See the [stories documentation from Marvel](https://developer.marvel.com/docs#!/public/getCreatorCollection_get_12)
    #   for valid options.
    # @return [Harkness::StoryDataWrapper] the top level wrapper around the story API response.
    # @example
    #   client.stories.list
    #   client.stories.list(creators: "1234", limit: 10, orderBy: "id")
    def list(**params)
      StoryDataWrapper.from_json(get_request("stories", params: params).body)
    end

    # Get a single story.
    # @param story_id [Integer] the ID of the story.
    # @return [Harkness::StoryDataWrapper] the top level wrapper around the story API response.
    # @example
    #   client.stories.retrieve(story_id: 1234)
    def retrieve(story_id:)
      StoryDataWrapper.from_json(get_request("stories/#{story_id}").body)
    end

    # Get a list of comics for a particular story.
    # @param story_id [Integer] the ID of the story.
    # @return [Harkness::ComicDataWrapper] the top level wrapper around the comic API response.
    # @example
    #   client.stories.comics(story_id: 1234)
    def comics(story_id:)
      ComicDataWrapper.from_json(get_request("stories/#{story_id}/comics").body)
    end

    # Get a list of events for a particular story.
    # @param story_id [Integer] the ID of the story.
    # @return [Harkness::EventDataWrapper] the top level wrapper around the event API response.
    # @example
    #   client.stories.events(story_id: 1234)
    def events(story_id:)
      EventDataWrapper.from_json(get_request("stories/#{story_id}/events").body)
    end

    # Get a list of series for a particular story.
    # @param story_id [Integer] the ID of the story.
    # @return [Harkness::SeriesDataWrapper] the top level wrapper around the series API response.
    # @example
    #   client.stories.series(story_id: 1234)
    def series(story_id:)
      SeriesDataWrapper.from_json(get_request("stories/#{story_id}/series").body)
    end

    # Get a list of characters for a particular story.
    # @param story_id [Integer] the ID of the story.
    # @return [Harkness::CharacterDataWrapper] the top level wrapper around the character API response.
    # @example
    #   client.stories.characters(story_id: 1234)
    def characters(story_id:)
      CharacterDataWrapper.from_json(get_request("stories/#{story_id}/characters").body)
    end

    # Get a list of creators for a particular story.
    # @param story_id [Integer] the ID of the story.
    # @return [Harkness::CreatorDataWrapper] the top level wrapper around the creator API response.
    # @example
    #   client.stories.creators(story_id: 1234)
    def creators(story_id:)
      CreatorDataWrapper.from_json(get_request("stories/#{story_id}/creators").body)
    end
  end
end
