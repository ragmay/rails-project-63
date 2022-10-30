module FormsGenerator
  class Submit
    def self.submit(text_of_button = "Save")
      Tag.build("input", type: "submit", value: text_of_button)
    end
  end
end
