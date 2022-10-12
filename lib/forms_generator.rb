# frozen_string_literal: true

require_relative "forms_generator/version"

module FormsGenerator
  class Error < StandardError; end
  autoload "Tag", "forms_generator/tag"

  def self.form_for(_name_user, url = {})
    url[:url] = "#" unless url[:url]
    "<form action=\"#{url[:url]}\" method=\"post\"></form>"
  end

  User = Struct.new(:name, :job, keyword_init: true)
  User.new name: "rob"
end
