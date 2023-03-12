# frozen_string_literal: true

module Harkness
  # The summary of a creator.
  class CreatorSummary < Harkness::Base::Summary
    # @!attribute [r] role
    # @return [String] the role of the creator in the parent entity.
    attribute :role, Shale::Type::String
  end

  # A list of creators.
  class CreatorList < Shale::Mapper
    # @!attribute [r] available
    # @return [Integer] the number of total available creators in this list.
    #   Will always be greater than or equal to the "returned" value.
    attribute :available, Shale::Type::Integer
    # @!attribute [r] returned
    # @return [Integer] the number of creators returned in this collection (up to 20).
    attribute :returned, Shale::Type::Integer
    # @!attribute [r] collectionURI
    # @return [String] the path to the full list of creators in this collection.
    attribute :collectionURI, Shale::Type::String
    # @!attribute [r] offset
    # @return [Array<Harkness::CreatorySummary>] the list of returned creators in this collection.
    attribute :items, Harkness::CreatorSummary, collection: true
  end
end
