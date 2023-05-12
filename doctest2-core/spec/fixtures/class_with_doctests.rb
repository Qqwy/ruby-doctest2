# Sample multi-line code
#
# >> a = 3
# >> a + 2
# => 5
class ClassWithDoctests

  # Always returns 'a'
  #
  # >> ClassWithDoctests.a
  # => 'a'
  def self.a
    'a'
  end

  # Always returns 'b'
  #
  # >> ClassWithDoctests.b
  # => 'b'
  def self.b
    'b'
  end

  # Example of doctest on single line
  #
  # >> ClassWithDoctests.c # => 'c'
  def self.c
    'c'
  end
end
