# frozen_string_literal: true

require 'rspec'
require 'doctest2/core'


require_relative "rspec/version"
require_relative "rspec/be_a_valid_doctest"
require_relative "rspec/doctest_helpers"

module Doctest2
  module RSpec
  end
end

RSpec.configure do |c|
  c.extend Doctest2::RSpec::DoctestHelpers
end
