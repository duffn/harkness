# frozen_string_literal: true

module Harkness
  class Creator < Shale::Mapper
    attribute :id, Shale::Type::Integer
    attribute :firstName, Shale::Type::String
    attribute :middleName, Shale::Type::String
    attribute :lastName, Shale::Type::String
    attribute :suffix, Shale::Type::String
    attribute :fullName, Shale::Type::String
    attribute :modified, Shale::Type::String
    attribute :resourceURI, Shale::Type::String
    attribute :urls, Harkness::URL, collection: true
    attribute :thumbnail, Harkness::Image
    attribute :series, Harkness::SeriesList
    attribute :stories, Harkness::StoryList
    attribute :comics, Harkness::ComicList
    attribute :events, Harkness::EventList
  end

  class CreatorDataContainer < Harkness::Base::DataContainer
    attribute :results, Harkness::Creator, collection: true
  end

  class CreatorDataWrapper < Harkness::Base::DataWrapper
    attribute :data, Harkness::CreatorDataContainer
  end
end
