# Doctest2

The best kind of documentation is documentation that can never go out of date!

Doctest2 adds documentation testing capabilities to your existing test suite:
The code examples in your documentation are now automatically turned into tests!

Doctest2 integrates with your existing test suite, making it a breeze to add to your project.

Doctest2 is split up in multiple gems, so you only pull in what you need:
- [doctest2-core](): Common core used by the other gems. Does the heavy lifting of extracting and evaluating doctests.
- [doctest2-rspec](): Wrapper to run doctests as part of a [RSpec]() test suite.
- [doctest2-minitest](): Wrapper to run doctests as part of a [Minitest]() test suite.

## Installation

### With RSpec:
1. Add the `doctest2-rspec` gem to your Gemfile:

```ruby
group :test do
  # ...

  gem 'doctest2-rspec, '~> 0.9.0', require: false
end
```

2. Include the extension by adding `require 'doctest2/rspec'` in your `spec/spec_helper.rb` (or on top of your individual RSpec test files).

Now you have access to the `doctest` class-method inside `describe` blocks.


### With Minitest
1. Add the `doctest2-minitest` gem to your Gemfile:

```ruby
group :test do
  # ...

  gem 'doctest2-minitest', '~> 0.9.0', require: false
end
```

2. Include the extension module in the unit test base class:

In `test/test_helper.rb` (before the `require 'minitest/autorun'` line, if it exists):

```ruby
class Minitest::Test
  include Doctest2::Minitest::DoctestHelpers
end
```

Now you have access to the `doctest` class-method in all test-classes.

### With another testing framework
If you're using another testing framework, you can invoke `doctest2-core` directly. Look at the source of the existing wrapper gems for inspiration. PRs adding support for other testing frameworks are very welcome!

## Usage

From within the module where the other tests regarding a particular class or module are placed, add the line `doctest MyClassOrModule`. This will add any doctests found in its source code as unit tests next to the other tests in that file:

```ruby
class Adder
  # Adds two to a given number
  #
  # Usage:
  #   >> m = Adder.new
  #   >> m.plus_two(3)
  #   => 5
  def plus_two(x)
    2 + x
  end
end
```

Within a RSpec test suite:
```ruby
require 'doctest/rspec'

describe Adder do
  doctest Adder

  ... # <- any normal tests here :-)
end
```

Within a Minitest test suite:
```ruby
require 'test_helper'

class AdderTest < Minitest::Test # Or `AdderTest < ActiveSupport::TestCase` in a Rails project
  doctest Adder

  ... # <- any normal tests here :-)
end
```

Because invoking the `doctest` class-method adds normal test cases to your test class,
any setup/cleanup logic can be added in exactly the same way as for normal test cases (using `before`/`after`/`around` for RSpec, `setup`/`teardown` for Minitest).

### Doctest syntax

Doctest2 extracts any comments starting with `>>` or `=>` (and any amount of whitespace).
A doctest consists of one or multiple comment lines starting with `>>`.
The outcome of evaluating these lines is compared (using `==`) to evaluating the single comment starting with `=>` (which can be on the next line or at the end of the last code line):

```ruby
class User
  attr_accessor :first_name, :last_name, :age

  def initialize(first_name: nil, last_name: nil)
    self.first_name = first_name
    self.last_name = last_name
  end

  # Presents the full name of the user.
  #
  # Usage:
  #
  #   >> bob = User.new(first_name: "Bob", last_name: "Ross")
  #   >> bob.display_name
  #   => "Bob Ross"
  #
  # If the last name is not set, only the first name will be used
  # without extra whitespace
  #
  #   >> User.new(first_name: "Adam")
  #   >> adam.display_name #=> "Adam"
  def display_name
    "#{first_name} #{last_name}".strip
  end
end
```

## Development

After checking out the repo, use the [just](https://github.com/casey/just) command runner for common tasks:

- `just setup`: Installs dev dependencies
- `just test`: Runs the test suite(s)
- `just console`: Opens an IRb console with the gem loaded for experimenting.
- `just install`: Install the gem(s) on your local machine.
- `just release`: Create and push a new release to the git repo and Rubygems. (Be sure to increase the version number in `version.rb` first!)

The same commands are available in the subdirectories, in which case they only operate on that particular gem.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Qqwy/ruby-doctest2.

## License

The gems are available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Attribution

This work is based on the original [doctest-core](https://rubygems.org/gems/doctest-core) and related gems, which have not been updated since 2014 and for which the repo is no longer available.

Alternative Ruby libraries for doctesting exist ([yard-doctest](https://rubygems.org/gems/yard-doctest), [rdoctest](https://rubygems.org/gems/rdoctest), [rubydoctest](https://rubygems.org/gems/rubydoctest), [dest](https://github.com/Reizar/Dest)), but none of them integrates with your normal test suite, instead using their own dedicated test runner.

The syntax and ergonomics of doctest2 takes inspiration from [Elixir's doctests](https://hexdocs.pm/ex_unit/1.12/ExUnit.DocTest.html).
