# frozen_string_literal: true

require 'pathname'
require_relative "minitest/version"

module Doctest2
  module Minitest
    module DoctestHelpers
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        ##
        # To be used inside the body of a tests-class
        # It will automatically create test cases for all
        # 'documentation test' snippets that exist in the comments
        # above the methods in `klass`.
        def doctest(klass)
          doctests = Doctest2::Core.extract_from(klass)
          return puts "Note: Attempting to extract doctests for #{klass}, but none were found (at: #{caller_locations.first})" if doctests.empty?

          doctests.each do |doctest|
            file_location = Pathname.new(doctest.original_file).relative_path_from(Pathname.pwd)
            define_method("test_ (doctest) #{file_location}:#{doctest.line}") do
              message = "While running doctest: \n\t#{doctest.code_string}\n"
              begin
                assert_equal(doctest.result_evaluation, doctest.code_evaluation, message)
              rescue StandardError => error
                error.message << "\n\n#{message}"
                raise error
              end
            end
          end
        end
      end
    end
  end
end
