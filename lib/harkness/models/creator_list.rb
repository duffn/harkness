# frozen_string_literal: true

module Harkness
  class CreatorSummary < Harkness::Base::Summary
    attribute :role, Shale::Type::String
  end

  class CreatorList < Shale::Mapper
    attribute :available, Shale::Type::Integer
    attribute :returned, Shale::Type::Integer
    attribute :collectionURI, Shale::Type::String
    attribute :items, Harkness::CreatorSummary, collection: true
  end
end
