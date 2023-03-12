# frozen_string_literal: true

module Harkness
  class ComicSummary < Harkness::Base::Summary
  end

  class ComicList < Shale::Mapper
    attribute :available, Shale::Type::Integer
    attribute :collectionURI, Shale::Type::String
    attribute :items, Harkness::ComicSummary, collection: true
  end
end
