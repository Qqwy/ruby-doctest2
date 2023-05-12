module Doctest2
  module Core
    class Doctest < Struct.new(:code_string, :result_string, :original_file, :line)

      def result_evaluation
        eval(result_string)
      end

      def code_evaluation
        eval(code_string)
      end

    end
  end
end
