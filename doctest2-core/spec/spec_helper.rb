require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'doctest2/core'

def fixture(filename)
  File.join(Gem::Specification.find_by_name('doctest2-core').gem_dir, 'spec', 'fixtures', filename)
end
