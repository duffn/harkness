# frozen_string_literal: true

module Harkness
  class EventSummary < Harkness::Base::Summary
  end

  class EventList < Shale::Mapper
    attribute :available, Shale::Type::Integer
    attribute :collectionURI, Shale::Type::String
    attribute :items, Harkness::EventSummary, collection: true
  end
end
