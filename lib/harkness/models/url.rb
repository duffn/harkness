# frozen_string_literal: true

module Harkness
  # A URL.
  class URL < Shale::Mapper
    attribute :type, Shale::Type::String
    attribute :url, Shale::Type::String
  end
end
