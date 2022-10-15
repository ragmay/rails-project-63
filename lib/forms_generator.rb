# frozen_string_literal: true

require_relative "forms_generator/version"

module FormsGenerator
  class Error < StandardError; end
  autoload "Tag", "forms_generator/tag"

  def self.form_for(_name_user, url = {})
    url[:url] = "#" unless url[:url]
    "<form action=\"#{url[:url]}\" method=\"post\"></form>"
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)
  user = User.new name: "rob", job: "hexlet", gender: "m"

  form =
    FormsGenerator.form_for user, url: "/users" do |f|
    end

  puts form
end
