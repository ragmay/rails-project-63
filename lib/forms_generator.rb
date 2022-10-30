# frozen_string_literal: true

require_relative "forms_generator/version"

# module for generation forms
module FormsGenerator
  class Error < StandardError; end
  autoload "Tag", "forms_generator/tag"
  autoload "Submit", "forms_generator/submit"

  def self.form_for(model, url = {})
    @model = model
    @html_fields = ""
    yield FormsGenerator if block_given?
    Tag.build("form", action: url[:url] || "#", method: url[:method] || "post") { @html_fields }
  end

  def self.label(field)
    Tag.build("label", for: field) { field.capitalize }
  end

  def self.input(field, **attributes_field)
    attributes_field[:name] = field
    if attributes_field[:as] == :text
      attributes_field = attributes_field.reject { |k, _v| k == :as }
      @html_fields += label(field)
      @html_fields += Tag.build("textarea", name: field, cols: attributes_field[:cols] || "20",
                                            rows: attributes_field[:rows] || "40", **attributes_field) do
        @model.public_send(field)
      end
    else
      @html_fields += label(field)
      @html_fields += Tag.build("input", **attributes_field, type: "text",
                                                             value: @model.public_send(field))
    end
  end

  def self.submit(text_of_button = "Save")
    @html_fields += Tag.build("input", type: "submit", value: text_of_button)
  end
end
