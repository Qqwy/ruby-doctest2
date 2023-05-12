require 'spec_helper'

module Doctest2::Core
  describe Doctest do

    def self.doctest(source)
      context "doctests for #{source}" do
        ::Doctest2::Core.extract_from(source).each do |doctest|
          it "at #{doctest.original_file}:#{doctest.line}" do
            expect(doctest.code_evaluation).to eql doctest.result_evaluation
          end
        end
      end
    end

    require fixture('class_with_doctests.rb')
    doctest ClassWithDoctests

    context 'evaluation' do

      it 'evaluates the result string' do
        expect(Doctest.new(nil, '5', nil, nil).result_evaluation).to equal 5
        expect(Doctest.new(nil, '3 + 2', nil, nil).result_evaluation).to equal 5
      end

      it 'evaluates the code string' do
        expect(Doctest.new("a = 3\na + 2", nil, nil, nil).code_evaluation).to equal 5
      end

    end

  end
end
