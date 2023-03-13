# frozen_string_literal: true

module Harkness
  # An individual creator.
  class Creator < Shale::Mapper
    # @!attribute [r] id
    # @return [Integer] the unique ID of the creator resource.
    attribute :id, Shale::Type::Integer
    # @!attribute [r] firstName
    # @return [String] the first name of the creator.
    attribute :firstName, Shale::Type::String
    # @!attribute [r] middleName
    # @return [String] the middle name of the creator.
    attribute :middleName, Shale::Type::String
    # @!attribute [r] lastName
    # @return [String] tThe last name of the creator.
    attribute :lastName, Shale::Type::String
    # @!attribute [r] suffix
    # @return [String] the suffix or honorific for the creator.
    attribute :suffix, Shale::Type::String
    # @!attribute [r] fullName
    # @return [String] the full name of the creator (a space-separated concatenation of the above four fields).
    attribute :fullName, Shale::Type::String
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
    # @return [Harkness::Image] the representative image for this creator.
    attribute :thumbnail, Harkness::Image
    # @!attribute [r] series
    # @return [Harkness::SeriesList] a resource list containing the series which feature work by this creator
    attribute :series, Harkness::SeriesList
    # @!attribute [r] stories
    # @return [Harkness::StoryList] A resource list containing the stories which feature work by this creator.
    attribute :stories, Harkness::StoryList
    # @!attribute [r] comics
    # @return [Harkness::ComicList] a resource list containing the comics which feature work by this creator.
    attribute :comics, Harkness::ComicList
    # @!attribute [r] events
    # @return [Harkness::EventList] a resource list containing the events which feature work by this creator.
    attribute :events, Harkness::EventList
  end

  # Container class that holds pagination information and results.
  class CreatorDataContainer < Harkness::Base::DataContainer
    # @!attribute [r] results
    # @return [Array<Harkness::Creator>] the list of creators returned by the call.
    attribute :results, Harkness::Creator, collection: true
  end

  # The top level wrapper of a response from the API.
  class CreatorDataWrapper < Harkness::Base::DataWrapper
    # @!attribute [r] data
    # @return [Harkness::CreatorDataContainer] the results returned by the call.
    attribute :data, Harkness::CreatorDataContainer
  end
end
