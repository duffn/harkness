# frozen_string_literal: true

module Harkness
  class Story < Shale::Mapper
    attribute :id, Shale::Type::Integer
    attribute :title, Shale::Type::String
    attribute :description, Shale::Type::String
    attribute :resourceURI, Shale::Type::String
    attribute :type, Shale::Type::String
    attribute :modified, Shale::Type::String
    attribute :thumbnail, Harkness::Image
    attribute :comics, Harkness::ComicList
    attribute :series, Harkness::SeriesList
    attribute :events, Harkness::EventList
    attribute :characters, Harkness::CharacterList
    attribute :originalIssue, Harkness::ComicSummary
  end

  class StoryDataContainer < Harkness::Base::DataContainer
    attribute :results, Harkness::Story, collection: true
  end

  class StoryDataWrapper < Harkness::Base::DataWrapper
    attribute :data, Harkness::StoryDataContainer
  end
end
