# frozen_string_literal: true

module Harkness
  module Base
    # Container class that holds pagination information.
    class DataContainer < Shale::Mapper
      # @!attribute [r] offset
      #   @return [Integer] the requested offset (number of skipped results) of the call.
      attribute :offset, Shale::Type::Integer
      # @!attribute [r] limit
      #   @return [Integer] the requested result limit.
      attribute :limit, Shale::Type::Integer
      # @!attribute [r] total
      #   @return [Integer] the total number of resources available given the current filter set.
      attribute :total, Shale::Type::Integer
      # @!attribute [r] count
      #   @return [Integer] the total number of results returned by this call.
      attribute :count, Shale::Type::Integer
    end
  end
end
