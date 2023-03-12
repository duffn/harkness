# frozen_string_literal: true

module Harkness
  module Base
    # The top level wrapper of a response from the API.
    class DataWrapper < Shale::Mapper
      # @!attribute [r] code
      #   @return [Integer] the HTTP status code of the returned result.
      attribute :code, Shale::Type::Integer
      # @!attribute [r] status
      #   @return [String] a string description of the call status.
      attribute :status, Shale::Type::String
      # @!attribute [r] copyright
      #   @return [String] the copyright notice for the returned result.
      attribute :copyright, Shale::Type::String
      # @!attribute [r] attributionText
      #   @return [String] the attribution notice for this result.
      #     Please display either this notice or the contents of the attributionHTML field on all
      #     screens which contain data from the Marvel Comics API.
      attribute :attributionText, Shale::Type::String
      # @!attribute [r] attributionHTML
      #   @return [String] an HTML representation of the attribution notice for this result.
      #     Please display either this notice or the contents of the attributionText field on all
      #     screens which contain data from the Marvel Comics API.
      attribute :attributionHTML, Shale::Type::String
      # @!attribute [r] data
      #   @return [Harkness::Base::DataContainer] the results returned by the call.
      attribute :data, Harkness::Base::DataContainer
      # @!attribute [r] etag
      #   @return [String] a digest value of the content returned by the call.
      attribute :etag, Shale::Type::String
    end
  end
end
