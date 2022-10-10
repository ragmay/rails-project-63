# frozen_string_literal: true

require_relative "lib/forms_generator/version"

Gem::Specification.new do |spec|
  spec.name = "forms_generator"
  spec.version = FormsGenerator::VERSION
  spec.authors = ["Alexandr Pameev"]
  spec.email = ["5567960@gmail.com"]

  spec.summary = "Forms Generator is a DSL with which it is convenient to generate forms."
  spec.description = "This library takes care of tasks that usually require you to write a lot of template code," \
                     "such as error handling. In the Rails world, Simple Form is used for this." \
                     "Our generator is similar to it conceptually, but arranged much simpler."
  spec.homepage = "https://github.com/ragmay/rails-project-63"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ragmay/rails-project-63"
  spec.metadata["changelog_uri"] = "https://github.com/ragmay/rails-project-63"

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
end
