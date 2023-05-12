require 'spec_helper'

module Doctest2::RSpec
  describe 'expect(doctest).to be_a_valid_doctest' do

    let(:valid_doctest){ Doctest2::Core::Doctest.new("4 + 1", "5", nil, nil) }
    let(:invalid_doctest){ Doctest2::Core::Doctest.new("4 + 2", "5", nil, nil) }

    it 'passes if the doctest is valid' do
      expect(valid_doctest).to be_a_valid_doctest
    end

    it 'fails if the doctest is invalid' do
      expect {
        expect(invalid_doctest).to be_a_valid_doctest
      }.to raise_error(
             "\nexpected: 5\n     got: 6\n\n(compared using ==)\n\nWhile running doctest: \n\t4 + 2\n")
    end
  end
end
