# frozen_string_literal: true

module Harkness
  class StorySummary < Harkness::Base::Summary
    attribute :type, Shale::Type::String
  end

  class StoryList < Shale::Mapper
    attribute :available, Shale::Type::Integer
    attribute :collectionURI, Shale::Type::String
    attribute :items, Harkness::StorySummary, collection: true
  end
end
