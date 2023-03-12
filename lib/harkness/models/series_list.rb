# frozen_string_literal: true

module Harkness
  # The summary of a series.
  class SeriesSummary < Harkness::Base::Summary
  end

  # A list of series.
  class SeriesList < Shale::Mapper
    # @!attribute [r] available
    # @return [Integer] the number of total available series in this list.
    #   Will always be greater than or equal to the "returned" value.
    attribute :available, Shale::Type::Integer
    # @!attribute [r] returned
    # @return [Integer] the number of series returned in this collection (up to 20).
    attribute :returned, Shale::Type::Integer
    # @!attribute [r] collectionURI
    # @return [String] the path to the full list of series in this collection.
    attribute :collectionURI, Shale::Type::String
    # @!attribute [r] items
    # @return [Array<Harkness::SeriesSummary>] the list of returned characters in this collection.
    attribute :items, Harkness::SeriesSummary, collection: true
  end
end
