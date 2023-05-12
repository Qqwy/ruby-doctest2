# frozen_string_literal: true

require_relative "core/version"
require_relative "core/base"
require_relative "core/doctest"
require_relative "core/source"

module Doctest2
  module Core
    def self.extract_from(source)
      Source.to_filenames(source).
        flat_map{|code_location| Base.analyze(code_location)}
    end
  end
end
