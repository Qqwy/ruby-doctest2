module Doctest2
  module Core
    module Source

      def self.to_filenames(source)
        case source
        when Class, Module
          constant_filenames(source)
        else
          [ source ]
        end
      end

      def self.constant_filenames(constant)
        (filenames_of_instance_methods(constant) + filenames_of_methods(constant)).uniq.sort
      end

      def self.filenames_of_instance_methods(constant)
        constant.
          instance_methods(false).
          map{|m| constant.instance_method(m).source_location}.
          map(&:first)
      end

      def self.filenames_of_methods(constant)
        constant.
          methods(false).
          map{|m| constant.method(m).source_location}.
          map(&:first)
      end
    end
  end
end
