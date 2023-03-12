# frozen_string_literal: true

module Harkness
  class ComicDate < Shale::Mapper
    attribute :type, Shale::Type::String
    attribute :date, Shale::Type::String
  end

  class ComicPrice < Shale::Mapper
    attribute :type, Shale::Type::String
    attribute :price, Shale::Type::Float
  end

  class Comic < Shale::Mapper
    attribute :id, Shale::Type::Integer
    attribute :digitalId, Shale::Type::Integer
    attribute :title, Shale::Type::String
    attribute :issueNumber, Shale::Type::Integer
    attribute :variantDescription, Shale::Type::String
    attribute :description, Shale::Type::String
    attribute :modified, Shale::Type::String
    attribute :isbn, Shale::Type::String
    attribute :upc, Shale::Type::String
    attribute :diamondCode, Shale::Type::String
    attribute :ean, Shale::Type::String
    attribute :issn, Shale::Type::String
    attribute :format, Shale::Type::String
    attribute :pageCount, Shale::Type::Integer
    attribute :textObjects, Harkness::TextObject, collection: true
    attribute :resourceURI, Shale::Type::String
    attribute :urls, Harkness::URL, collection: true
    attribute :series, Harkness::SeriesSummary
    attribute :variants, Harkness::ComicSummary, collection: true
    attribute :collections, Harkness::ComicSummary, collection: true
    attribute :collectedIssues, Harkness::ComicSummary, collection: true
    attribute :dates, Harkness::ComicDate, collection: true
    attribute :prices, Harkness::ComicPrice, collection: true
    attribute :thumbnail, Harkness::Image
    attribute :images, Harkness::Image, collection: true
    attribute :creators, Harkness::CreatorList
    attribute :characters, Harkness::CharacterList
    attribute :stories, Harkness::StoryList
    attribute :events, Harkness::EventList
  end

  class ComicDataContainer < Harkness::Base::DataContainer
    attribute :results, Harkness::Comic, collection: true
  end

  class ComicDataWrapper < Harkness::Base::DataWrapper
    attribute :data, Harkness::ComicDataContainer
  end
end
