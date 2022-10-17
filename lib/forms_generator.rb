# frozen_string_literal: true

require_relative "forms_generator/version"

# module for generation forms
module FormsGenerator
  class Error < StandardError; end
  autoload "Tag", "forms_generator/tag"

  def self.form_for(user_structure, url = {})
    @user_structure = user_structure
    @field_generation = ""
    yield FormsGenerator if block_given?
    Tag.build("form", action: url[:url] || "#", method: url[:method] || "post") { @field_generation }
  end

  def self.input(field, **attributes_field)
    attributes_field[:name] = field
    if attributes_field[:as] == :text
      attributes_field.delete(:as)
      @field_generation += Tag.build("textarea", name: field, cols: attributes_field[:cols] || "20",
                                                 rows: attributes_field[:rows] || "40", **attributes_field) do
        @user_structure.public_send(field)
      end
    else
      @field_generation += Tag.build("input", **attributes_field, type: "text",
                                                                  value: @user_structure.public_send(field))
    end
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)
  user = User.new name: "rob", job: "hexlet", gender: "m"

  FormsGenerator.form_for user, url: "/users" do |f|
    f.input :name
    f.input :job, as: :text
  end

  FormsGenerator.form_for user do |f|
    f.input :name
    f.input :job, as: :text
  end

  FormsGenerator.form_for user, url: "#" do |f|
    f.input :name, class: "user-input"
    f.input :job
  end

  FormsGenerator.form_for user do |f|
    f.input :job, as: :text
  end

  FormsGenerator.form_for user, url: "#" do |f|
    f.input :job, as: :text, rows: 50, cols: 50
  end

  # FormsGenerator.form_for user, url: "/users" do |f|
  #   f.input :name
  #   f.input :job, as: :text
  #   f.input :age
  # end
end
