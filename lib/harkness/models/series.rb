# frozen_string_literal: true

module Harkness
  # An individual series.
  class Series < Shale::Mapper
    # @!attribute [r] id
    # @return [Integer] the unique ID of the series resource.
    attribute :id, Shale::Type::Integer
    # @!attribute [r] title
    # @return [String] the canonical title of the series.
    attribute :title, Shale::Type::String
    # @!attribute [r] description
    # @return [String] a description of the series.
    attribute :description, Shale::Type::String
    # @!attribute [r] resourceURI
    # @return [String] the canonical URL identifier for this resource.
    attribute :resourceURI, Shale::Type::String
    # @!attribute [r] urls
    # @return [Array<Harkness::URL>] a set of public web site URLs for the resource.
    attribute :urls, Harkness::URL, collection: true
    # @!attribute [r] startYear
    # @return [Integer] the first year of publication for the series.
    attribute :startYear, Shale::Type::Integer
    # @!attribute [r] endYear
    # @return [Integer] the last year of publication for the series (conventionally, 2099 for ongoing series).
    attribute :endYear, Shale::Type::Integer
    # @!attribute [r] rating
    # @return [String] the age-appropriateness rating for the series.
    attribute :rating, Shale::Type::String
    # @!attribute [r] modified
    # @return [String] the date the resource was most recently modified.
    attribute :modified, Shale::Type::String
    # @!attribute [r] thumbnail
    # @return [Harkness::Image] the representative image for this SERIES.
    attribute :thumbnail, Harkness::Image
    # @!attribute [r] comics
    # @return [Harkness::ComicList] : a resource list containing comics in this series.
    attribute :comics, Harkness::ComicList
    # @!attribute [r] stories
    # @return [Harkness::StoryList] a resource list containing stories which occur in comics in this series.
    attribute :stories, Harkness::StoryList
    # @!attribute [r] events
    # @return [Harkness::EventList] a resource list containing events which take place in comics in this series.
    attribute :events, Harkness::EventList
    # @!attribute [r] characters
    # @return [Harkness::CharacterList] a resource list containing characters which appear in comics in this series.
    attribute :characters, Harkness::CharacterList
    # @!attribute [r] creators
    # @return [Harkness::CreatorList] a resource list of creators whose work appears in comics in this series.
    attribute :creators, Harkness::CreatorList
    # @!attribute [r] next
    # @return [Harkness::SeriesSummary] a summary representation of the series which follows this series.,
    attribute :next, Harkness::SeriesSummary
    # @!attribute [r] next
    # @return [Harkness::SeriesSummary] a summary representation of the series which preceded this series.
    attribute :previous, Harkness::SeriesSummary
  end

  # Container class that holds pagination information and results.
  class SeriesDataContainer < Harkness::Base::DataContainer
    # @!attribute [r] results
    # @return [Array<Harkness::Series>] the list of series returned by the call.
    attribute :results, Harkness::Series, collection: true
  end

  # The top level wrapper of a response from the API.
  class SeriesDataWrapper < Harkness::Base::DataWrapper
    # @!attribute [r] data
    # @return [Harkness::SeriesDataContainer] the results returned by the call.
    attribute :data, Harkness::SeriesDataContainer
  end
end
