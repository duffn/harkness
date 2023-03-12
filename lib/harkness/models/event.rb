# frozen_string_literal: true

module Harkness
  class Event < Shale::Mapper
    attribute :id, Shale::Type::Integer
    attribute :title, Shale::Type::String
    attribute :description, Shale::Type::String
    attribute :resourceURI, Shale::Type::String
    attribute :urls, Harkness::URL, collection: true
    attribute :modified, Shale::Type::String
    attribute :start, Shale::Type::String
    attribute :end, Shale::Type::String
    attribute :thumbnail, Harkness::Image
    attribute :comics, Harkness::ComicList
    attribute :stories, Harkness::StoryList
    attribute :series, Harkness::SeriesList
    attribute :characters, Harkness::CharacterList
    attribute :creators, Harkness::CreatorList
    attribute :next, Harkness::EventSummary
    attribute :previous, Harkness::EventSummary
  end

  class EventDataContainer < Harkness::Base::DataContainer
    attribute :results, Harkness::Event, collection: true
  end

  class EventDataWrapper < Harkness::Base::DataWrapper
    attribute :data, Harkness::EventDataContainer
  end
end
