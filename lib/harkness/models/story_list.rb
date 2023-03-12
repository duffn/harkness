# frozen_string_literal: true

module Harkness
  # The summary of a story.
  class StorySummary < Harkness::Base::Summary
    # @!attribute [r] type
    # @return [String] the type of the story (interior or cover)
    attribute :type, Shale::Type::String
  end

  # A list of stories.
  class StoryList < Shale::Mapper
    # @!attribute [r] available
    # @return [Integer] the number of total available stories in this list.
    #   Will always be greater than or equal to the "returned" value.
    attribute :available, Shale::Type::Integer
    # @!attribute [r] returned
    # @return [Integer] the number of stories returned in this collection (up to 20).
    attribute :returned, Shale::Type::Integer
    # @!attribute [r] collectionURI
    # @return [String] the path to the full list of stories in this collection.
    attribute :collectionURI, Shale::Type::String
    # @!attribute [r] items
    # @return [Array<Harkness::StorySummary>] the list of returned characters in this collection.
    attribute :items, Harkness::StorySummary, collection: true
  end
end
