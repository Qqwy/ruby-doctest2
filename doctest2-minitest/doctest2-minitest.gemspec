# frozen_string_literal: true

require_relative "lib/doctest2/minitest/version"

Gem::Specification.new do |spec|
  spec.name = "doctest2-minitest"
  spec.version = Doctest2::Minitest::VERSION
  spec.authors = ["Qqwy/Marten"]
  spec.email = ["qqwy@gmx.com"]

  spec.summary = "Run doctests in your Minitest test suite"
  spec.description = "Integrates documentation tests with Minitest."
  spec.homepage = "https://github.com/Qqwy/ruby-doctest2"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/Qqwy/ruby-doctest2/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  # spec.add_dependency "doctest2-core", path: "../doctest2-core"
  spec.add_dependency "doctest2-core", "~> 0.9.0"
  spec.add_dependency "minitest", "~> 5.0"
end
