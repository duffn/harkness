# frozen_string_literal: true

module Harkness
  # The summary of a character.
  class CharacterSummary < Harkness::Base::Summary
    # @!attribute [r] role
    # @return [String] the role of the character in the parent entity.
    attribute :role, Shale::Type::String
  end

  # A list of characters.
  class CharacterList < Shale::Mapper
    # @!attribute [r] available
    # @return [Integer] the number of total available characters in this list.
    #   Will always be greater than or equal to the "returned" value.
    attribute :available, Shale::Type::Integer
    # @!attribute [r] returned
    # @return [Integer] the number of characters returned in this collection (up to 20).
    attribute :returned, Shale::Type::Integer
    # @!attribute [r] collectionURI
    # @return [String] the path to the full list of characters in this collection.
    attribute :collectionURI, Shale::Type::String
    # @!attribute [r] items
    # @return [Array<Harkness::CharacterSummary>] the list of returned characters in this collection.
    attribute :items, Harkness::CharacterSummary, collection: true
  end
end
