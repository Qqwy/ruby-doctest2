# frozen_string_literal: true

require_relative "lib/doctest2/core/version"

Gem::Specification.new do |spec|
  spec.name = "doctest2-core"
  spec.version = Doctest2::Core::VERSION
  spec.authors = ["Qqwy/Marten"]
  spec.email = ["qqwy@gmx.com"]

  spec.summary = "Forms the basis of extracting and running doctests (documentation tests). Core used by test-framework-specific gems."
  spec.description = "Extract doctests from Ruby files."
  spec.homepage = "https://github.com/Qqwy/ruby-doctest2"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Qqwy/ruby-doctest2-core/"
  spec.metadata["changelog_uri"] = "https://github.com/Qqwy/ruby-doctest2-core/blob/main/CHANGELOG.md"

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


  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
end
