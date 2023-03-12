# frozen_string_literal: true

require "faraday"
require "shale"

# Harkness
require "harkness/version"
require "harkness/client"
require "harkness/resource"
require "harkness/error"

# Base objects
require "harkness/models/base/data_container"
require "harkness/models/base/data_wrapper"
require "harkness/models/base/summary"

# Shared models
require "harkness/models/text_object"
require "harkness/models/image"
require "harkness/models/url"
require "harkness/models/comic_list"
require "harkness/models/creator_list"
require "harkness/models/character_list"
require "harkness/models/event_list"
require "harkness/models/story_list"
require "harkness/models/series_list"

# Models
require "harkness/models/character"
require "harkness/models/comic"
require "harkness/models/creator"
require "harkness/models/event"
require "harkness/models/series"
require "harkness/models/story"

# Resources
require "harkness/resources/character"
require "harkness/resources/comic"
require "harkness/resources/creator"
require "harkness/resources/event"
require "harkness/resources/series"
require "harkness/resources/story"
