module FormsGenerator
  class Tag
    attr_reader :name_tag, :attributes_tag, :result_block

    def initialize
      @name_tag = name_tag
      @attributes_tag = attributes_tag
      @result_block = result_block
    end

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
