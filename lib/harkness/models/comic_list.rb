# frozen_string_literal: true

module Harkness
  # The summary of a comic.
  class ComicSummary < Harkness::Base::Summary
  end

  # A list of comics.
  class ComicList < Shale::Mapper
    # @!attribute [r] available
    # @return [Integer] the number of total available issues in this list. Will always be greater than
    #   or equal to the "returned" value.
    attribute :available, Shale::Type::Integer
    # @!attribute [r] returned
    # @return [Integer] the number of comics returned in this collection (up to 20).
    attribute :returned, Shale::Type::Integer
    # @!attribute [r] collectionURI
    # @return [String] the path to the full list of issues in this collection.
    attribute :collectionURI, Shale::Type::String
    # @!attribute [r] collectionURI
    # @return [Array<Harkness::ComicSummary>] the list of returned issues in this collection.
    attribute :items, Harkness::ComicSummary, collection: true
  end
end
