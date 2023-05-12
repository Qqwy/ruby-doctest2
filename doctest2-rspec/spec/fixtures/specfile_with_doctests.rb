require 'spec_helper'

class ClassWithDoctests
  # >> ClassWithDoctests.a
  # => 'a'
  def self.a
    'b'
  end
end

describe 'doctest' do
  doctest ClassWithDoctests
end
