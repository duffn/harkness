# frozen_string_literal: true

module Harkness
  # A text object.
  class TextObject < Shale::Mapper
    # @!attribute [r] type
    # @return [String] the canonical type of the text object (e.g. solicit text, preview text, etc.).
    attribute :type, Shale::Type::String
    # @!attribute [r] language
    # @return [String] the IETF language tag denoting the language the text object is written in.
    attribute :language, Shale::Type::String
    # @!attribute [r] text
    # @return [String] the text.
    attribute :text, Shale::Type::String
  end
end
