require 'spec_helper'
require fixture('class_with_doctests.rb')

describe Doctest2::Core do

  it 'extracts doctests from ruby classes' do
    orig_file = fixture('class_with_doctests.rb')
    doctests = Doctest2::Core.extract_from(ClassWithDoctests)
    expect(doctests.length).to equal 3

    expect(doctests[0]).to eql Doctest2::Core::Doctest.new("a = 3;a + 2", "5", orig_file, 5)
    expect(doctests[1]).to eql Doctest2::Core::Doctest.new("ClassWithDoctests.a", "'a'", orig_file, 11)
    expect(doctests[2]).to eql Doctest2::Core::Doctest.new("ClassWithDoctests.b", "'b'", orig_file, 19)
  end

end
