require 'spec_helper'

describe Doctest2::Core::Base do

  it 'extracts simple code samples' do
    str = <<-END.gsub(/^ {6}/, '')
      # >> 3 + 2
      # => 5
    END
    analyzer = Doctest2::Core::Base.new(str)

    doctests = analyzer.analyze
    expect(doctests.length).to equal 1

    expect(doctests[0]).to eql Doctest2::Core::Doctest.new("3 + 2", "5", nil, 2)
  end

  it 'extracts multiple samples from a string' do
    str = <<-END.gsub(/^ {6}/, '')
      # >> 3 + 2
      # => 5
      def foo
      end
      # >> 4 + 2
      # => 6
    END
    analyzer = Doctest2::Core::Base.new(str)

    doctests = analyzer.analyze
    expect(doctests.length).to equal 2

    expect(doctests[0]).to eql Doctest2::Core::Doctest.new("3 + 2", "5", nil, 2)
    expect(doctests[1]).to eql Doctest2::Core::Doctest.new("4 + 2", "6", nil, 6)
  end

end
