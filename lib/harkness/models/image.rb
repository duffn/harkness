# frozen_string_literal: true

module Harkness
  # An image.
  class Image < Shale::Mapper
    attribute :path, Shale::Type::String
    attribute :extension, Shale::Type::String
  end
end
