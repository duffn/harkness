# frozen_string_literal: true

module Harkness
  # A text objct
  class TextObject < Shale::Mapper
    attribute :type, Shale::Type::String
    attribute :language, Shale::Type::String
    attribute :text, Shale::Type::String
  end
end
