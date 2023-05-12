module Doctest2
  module Core
    class Base

      def self.analyze(str)
        self.new(str).analyze
      end

      CODE_AND_RESULT_REGEXP   = /^\s*#\s*>>\s*(?<code>.*)?#\s*=>\s*(?<result>.*)$/
      CODE_REGEXP   = /^\s*#\s*>>\s*(?<code>.*)/
      RESULT_REGEXP = /#\s*=>\s*(?<result>.*)$/

      def initialize(source)
        if File.exist?(source)
          @filename = source
          @str = File.read(source)
        else
          @filename = nil
          @str = source
        end
        @state   = :no_match
        @current = nil
        @doctests = []
      end

      def analyze
        @str.lines.each.with_index do |line, index|
          case line
          when CODE_AND_RESULT_REGEXP
            code = Regexp.last_match['code']
            result = Regexp.last_match['result']
            handle_code(code)
            handle_result(result, index)
          when CODE_REGEXP
            handle_code(Regexp.last_match['code'])
          when RESULT_REGEXP
            handle_result(Regexp.last_match['result'], index)
          else
            handle_no_doctest
          end
        end

        @doctests
      end

      private

      def add_doctest(code_lines, result, line_index)
        @doctests << Doctest.new(code_lines.join(';'), result, @filename, line_index + 1)
      end

      def handle_code(code)
        case @state
        when :no_match
          @current_code = [code]
          @state = :match
        when :match
          @current_code << code
        end
      end

      def handle_result(result, line_index)
        case @state
        when :match
          add_doctest(@current_code, result, line_index)
          reset
        end
      end

      def handle_no_doctest
        reset
      end

      def reset
        @state = :no_match
        @current
      end

    end
  end
end
