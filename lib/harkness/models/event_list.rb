# frozen_string_literal: true

module Harkness
  class EventSummary < Harkness::Base::Summary
  end

  class EventList < Shale::Mapper
    # @!attribute [r] available
    # @return [Integer] the number of total available events in this list.
    #   Will always be greater than or equal to the "returned" value.
    attribute :available, Shale::Type::Integer
    # @!attribute [r] returned
    # @return [Integer] the number of events returned in this collection (up to 20).
    attribute :returned, Shale::Type::Integer
    # @!attribute [r] collectionURI
    # @return [String] the path to the full list of events in this collection.
    attribute :collectionURI, Shale::Type::String
    # @!attribute [r] items
    # @return [Array<Harkness::EventSummary>] the list of returned characters in this collection.
    attribute :items, Harkness::EventSummary, collection: true
  end
end
