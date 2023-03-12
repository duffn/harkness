# frozen_string_literal: true

module Harkness
  class Series < Shale::Mapper
    attribute :id, Shale::Type::Integer
    attribute :title, Shale::Type::String
    attribute :description, Shale::Type::String
    attribute :resourceURI, Shale::Type::String
    attribute :urls, Harkness::URL, collection: true

    attribute :startYear, Shale::Type::Integer
    attribute :endYear, Shale::Type::Integer
    attribute :rating, Shale::Type::String
    attribute :modified, Shale::Type::String
    attribute :thumbnail, Harkness::Image
    attribute :comics, Harkness::ComicList
    attribute :stories, Harkness::StoryList
    attribute :events, Harkness::EventList
    attribute :characters, Harkness::CharacterList
    attribute :creators, Harkness::CreatorList
    attribute :next, Harkness::SeriesSummary
    attribute :previous, Harkness::SeriesSummary
  end

  class SeriesDataContainer < Harkness::Base::DataContainer
    attribute :results, Harkness::Series, collection: true
  end

  class SeriesDataWrapper < Harkness::Base::DataWrapper
    attribute :data, Harkness::SeriesDataContainer
  end
end
