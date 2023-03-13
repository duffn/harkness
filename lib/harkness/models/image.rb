# frozen_string_literal: true

module Harkness
  # An image.
  class Image < Shale::Mapper
    # @!attribute [r] path
    # @return [String] the directory path of to the image.,
    attribute :path, Shale::Type::String
    # @!attribute [r] extension
    # @return [String] the file extension for the image.
    attribute :extension, Shale::Type::String
  end
end
