require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'doctest2/rspec'

def fixture(filename)
  File.join(Gem::Specification.find_by_name('doctest2-rspec').gem_dir, 'spec', 'fixtures', filename)
end
