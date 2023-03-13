# frozen_string_literal: true

module Harkness
  # A URL.
  class URL < Shale::Mapper
    # @!attribute [r] type
    # @return [String] a text identifier for the URL.
    attribute :type, Shale::Type::String
    # @!attribute [r] url
    # @return [String] a full URL (including scheme, domain, and path).
    attribute :url, Shale::Type::String
  end
end
