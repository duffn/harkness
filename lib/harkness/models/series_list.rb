# frozen_string_literal: true

module Harkness
  class SeriesSummary < Harkness::Base::Summary
  end

  class SeriesList < Shale::Mapper
    attribute :available, Shale::Type::Integer
    attribute :collectionURI, Shale::Type::String
    attribute :items, Harkness::SeriesSummary, collection: true
  end
end
