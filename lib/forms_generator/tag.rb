# frozen_string_literal: true

module FormsGenerator
  # class containing method of build tags
  class Tag
    def self.build(name_tag, **attributes_tag)
      attributes = attributes_tag.map { |key, value| " #{key}=\"#{value}\"" }.reject(&:empty?).join
      if block_given?
        "<#{name_tag}#{attributes}>#{yield}</#{name_tag}>"
      else
        "<#{name_tag}#{attributes}>"
      end
    end
  end
end
