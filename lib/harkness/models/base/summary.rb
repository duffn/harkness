# frozen_string_literal: true

module Harkness
  module Base
    # Base class for the "summary" objects in an API response. These summary objects are
    #   linked objects to the main API response. For example, when retrieving a Character,
    #   one of the summary objects is a Series.
    class Summary < Shale::Mapper
      # @!attribute [r] resourceURI
      #   @return [String] the path to the individual resource.
      attribute :resourceURI, Shale::Type::String
      # @!attribute [r] name
      #   @return [String] the canonical name of the resource.
      attribute :name, Shale::Type::String
    end
  end
end
