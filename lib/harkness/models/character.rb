# frozen_string_literal: true

module Harkness
  # An individual character.
  class Character < Shale::Mapper
    # @!attribute [r] id
    # @return [Integer] the unique ID of the character resource.
    attribute :id, Shale::Type::Integer
    # @!attribute [r] name
    # @return [String] the name of the character.
    attribute :name, Shale::Type::String
    # @!attribute [r] description
    # @return [String] a short bio or description of the character
    attribute :description, Shale::Type::String
    # @!attribute [r] modified
    # @return [String] the date the resource was most recently modified.
    attribute :modified, Shale::Type::String
    # @!attribute [r] resourceURI
    # @return [String] the canonical URL identifier for this resource.
    attribute :resourceURI, Shale::Type::String
    # @!attribute [r] urls
    # @return [Array<Harkness::URL>] a set of public web site URLs for the resource.
    attribute :urls, Harkness::URL, collection: true
    # @!attribute [r] thumbnail
    # @return [Harkness::Image] the representative image for this character.
    attribute :thumbnail, Harkness::Image
    # @!attribute [r] comics
    # @return [Harkness::ComicList] a resource list containing comics which feature this character.
    attribute :comics, Harkness::ComicList
    # @!attribute [r] stories
    # @return [Harkness::StoryList] a resource list of stories in which this character appears.
    attribute :stories, Harkness::StoryList
    # @!attribute [r] events
    # @return [Harkness::EventList] a resource list of events in which this character appears.
    attribute :events, Harkness::EventList
    # @!attribute [r] series
    # @return [Harkness::SeriesList] a resource list of series in which this character appears.
    attribute :series, Harkness::SeriesList
  end

  # Container class that holds pagination information and results.
  class CharacterDataContainer < Harkness::Base::DataContainer
    # @!attribute [r] results
    # @return [Array<Harkness::Character>] the list of characters returned by the call.
    attribute :results, Harkness::Character, collection: true
  end

  # The top level wrapper of a response from the API.
  class CharacterDataWrapper < Harkness::Base::DataWrapper
    # @!attribute [r] data
    # @return [Harkness::CharacterDataContainer] the results returned by the call.
    attribute :data, Harkness::CharacterDataContainer
  end
end
