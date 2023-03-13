# frozen_string_literal: true

module Harkness
  # An individual story
  class Story < Shale::Mapper
    # @!attribute [r] id
    # @return [Integer] the unique ID of the story resource.
    attribute :id, Shale::Type::Integer
    # @!attribute [r] title
    # @return [String] the canonical title of the story.
    attribute :title, Shale::Type::String
    # @!attribute [r] description
    # @return [String] a description of the story.
    attribute :description, Shale::Type::String
    # @!attribute [r] resourceURI
    # @return [String] the canonical URL identifier for this resource.
    attribute :resourceURI, Shale::Type::String
    # @!attribute [r] type
    # @return [String] ' the story type e.g. interior story, cover, text story.
    attribute :type, Shale::Type::String
    # @!attribute [r] modified
    # @return [String] the date the resource was most recently modified.
    attribute :modified, Shale::Type::String
    # @!attribute [r] thumbnail
    # @return [String] the representative image for this story.
    attribute :thumbnail, Harkness::Image
    # @!attribute [r] comics
    # @return [Harkness::ComicList]  a resource list containing comics in which this story takes place.
    attribute :comics, Harkness::ComicList
    # @!attribute [r] series
    # @return [Harkness::SeriesList] a resource list containing series in which this story appears.
    attribute :series, Harkness::SeriesList
    # @!attribute [r] events
    # @return [Harkness::EventList] a resource list of the events in which this story appears.
    attribute :events, Harkness::EventList
    # @!attribute [r] characters
    # @return [Harkness::CharacterList] a resource list of characters which appear in this story.
    attribute :characters, Harkness::CharacterList
    # @!attribute [r] originalIssue
    # @return [Harkness::ComicSummary] a summary representation of the issue in which this story was
    #   originally published.
    attribute :originalIssue, Harkness::ComicSummary
  end

  # Container class that holds pagination information and results.
  class StoryDataContainer < Harkness::Base::DataContainer
    # @!attribute [r] results
    # @return [Array<Harkness::Story>] the list of stories returned by the call.
    attribute :results, Harkness::Story, collection: true
  end

  # The top level wrapper of a response from the API.
  class StoryDataWrapper < Harkness::Base::DataWrapper
    # @!attribute [r] data
    # @return [Harkness::StoryDataContainer] the results returned by the call.
    attribute :data, Harkness::StoryDataContainer
  end
end
