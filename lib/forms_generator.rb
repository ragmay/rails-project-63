# frozen_string_literal: true

require_relative "forms_generator/version"

module FormsGenerator
  class Error < StandardError; end
  autoload "Tag", "forms_generator/tag"
end
