# frozen_string_literal: true

module Harkness
  # The data of a comic.
  class ComicDate < Shale::Mapper
    # @!attribute [r] type
    # @return [String] a description of the date (e.g. onsale date, FOC date).
    attribute :type, Shale::Type::String
    # @!attribute [r] date
    # @return [String] the date.
    attribute :date, Shale::Type::String
  end

  # The price of a comic.
  class ComicPrice < Shale::Mapper
    # @!attribute [r] type
    # @return [String] a description of the price (e.g. print price, digital price).
    attribute :type, Shale::Type::String
    # @!attribute [r] price
    # @return [Float] the price (all prices in USD).
    attribute :price, Shale::Type::Float
  end

  # An individual character.
  class Comic < Shale::Mapper
    # @!attribute [r] id
    # @return [Integer] the unique ID of the comic resource.
    attribute :id, Shale::Type::Integer
    # @!attribute [r] digitalId
    # @return [Integer] the ID of the digital comic representation of this comic. Will be 0 if the comic is
    #   not available digitally.
    attribute :digitalId, Shale::Type::Integer
    # @!attribute [r] title
    # @return [String] the canonical title of the comic.
    attribute :title, Shale::Type::String
    # @!attribute [r] issueNumber
    # @return [Integer] the number of the issue in the series (will generally be 0 for collection formats).
    attribute :issueNumber, Shale::Type::Integer
    # @!attribute [r] variantDescription
    # @return [String] If the issue is a variant (e.g. an alternate cover, second printing, or director’s cut),
    #   a text description of the variant.
    attribute :variantDescription, Shale::Type::String
    # @!attribute [r] description
    # @return [String] the preferred description of the comic.
    attribute :description, Shale::Type::String
    # @!attribute [r] modified
    # @return [String] the date the resource was most recently modified.
    attribute :modified, Shale::Type::String
    # @!attribute [r] isbn
    # @return [String] the ISBN for the comic (generally only populated for collection formats).
    attribute :isbn, Shale::Type::String
    # @!attribute [r] upc
    # @return [String] the UPC barcode number for the comic (generally only populated for periodical formats).
    attribute :upc, Shale::Type::String
    # @!attribute [r] diamondCode
    # @return [String] the Diamond code for the comic.
    attribute :diamondCode, Shale::Type::String
    # @!attribute [r] ean
    # @return [String] the EAN barcode for the comic.
    attribute :ean, Shale::Type::String
    # @!attribute [r] issn
    # @return [String] the ISSN barcode for the comic.
    attribute :issn, Shale::Type::String
    # @!attribute [r] format
    # @return [String] the publication format of the comic e.g. comic, hardcover, trade paperback.
    attribute :format, Shale::Type::String
    # @!attribute [r] pageCount
    # @return [Integer] the number of story pages in the comic.
    attribute :pageCount, Shale::Type::Integer
    # @!attribute [r] textObjects
    # @return [Array<Harkness::TextObject>] a set of descriptive text blurbs for the comic.
    attribute :textObjects, Harkness::TextObject, collection: true
    # @!attribute [r] resourceURI
    # @return [String] the canonical URL identifier for this resource.
    attribute :resourceURI, Shale::Type::String
    # @!attribute [r] urls
    # @return [Array<Harkness::URL>] a set of public web site URLs for the resource.
    attribute :urls, Harkness::URL, collection: true
    # @!attribute [r] series
    # @return [Array<Harkness::SeriesSummary>] a summary representation of the series to which this comic belongs.
    attribute :series, Harkness::SeriesSummary
    # @!attribute [r] variants
    # @return [Array<Harkness::ComicSummary>] a list of variant issues for this comic (includes the "original" issue
    #   if the current issue is a variant).
    attribute :variants, Harkness::ComicSummary, collection: true
    # @!attribute [r] collections
    # @return [Array<Harkness::ComicSummary>] A list of collections which include this comic (will generally
    #   be empty if the comic's format is a collection).
    attribute :collections, Harkness::ComicSummary, collection: true
    # @!attribute [r] collectedIssues
    # @return [Array<Harkness::ComicSummary>] a list of issues collected in this comic (will generally
    #   be empty for periodical formats such as "comic" or "magazine").
    attribute :collectedIssues, Harkness::ComicSummary, collection: true
    # @!attribute [r] dates
    # @return [Array<Harkness::ComicDate] a list of key dates for this comic.
    attribute :dates, Harkness::ComicDate, collection: true
    # @!attribute [r] prices
    # @return [Array<Harkness::ComicPrice>] a list of prices for this comic.
    attribute :prices, Harkness::ComicPrice, collection: true
    # @!attribute [r] thumbnail
    # @return [Harkness::Image] the representative image for this comic.
    attribute :thumbnail, Harkness::Image
    # @!attribute [r] images
    # @return [Array<Harkness::Image>] a list of promotional images associated with this comic.
    attribute :images, Harkness::Image, collection: true
    # @!attribute [r] creators
    # @return [Harkness::CreatorList] a resource list containing the creators associated with this comic.
    attribute :creators, Harkness::CreatorList
    # @!attribute [r] characters
    # @return [Harkness::CharacterList] a resource list containing the characters which appear in this comic.
    attribute :characters, Harkness::CharacterList
    # @!attribute [r] stories
    # @return [Harkness::StoryList] a resource list containing the stories which appear in this comic.
    attribute :stories, Harkness::StoryList
    # @!attribute [r] events
    # @return [Harkness::EventList] a resource list containing the events in which this comic appears.
    attribute :events, Harkness::EventList
  end

  # Container class that holds pagination information and results.
  class ComicDataContainer < Harkness::Base::DataContainer
    # @!attribute [r] results
    # @return [Array<Harkness::Comic>] the list of comics returned by the call.
    attribute :results, Harkness::Comic, collection: true
  end

  # The top level wrapper of a response from the API.
  class ComicDataWrapper < Harkness::Base::DataWrapper
    # @!attribute [r] data
    # @return [Harkness::ComicDataContainer] The results returned by the call.
    attribute :data, Harkness::ComicDataContainer
  end
end
