# frozen_string_literal: true

require "test_helper"

class TestFormsGenerator < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FormsGenerator::VERSION
  end

  def test_it_does_something_useful
    assert_equal ::FormsGenerator::Tag.build("br"), "<br>"
    assert_equal ::FormsGenerator::Tag.build("img", src: "path/to/image"), "<img src=\"path/to/image\">"
    assert_equal ::FormsGenerator::Tag.build("input", type: "submit", value: "Save"),
                 "<input type=\"submit\" value=\"Save\">"
    assert_equal ::FormsGenerator::Tag.build("label") { "Email" }, "<label>Email</label>"
    assert_equal ::FormsGenerator::Tag.build("label", for: "email") {
                   "Email"
                 }, "<label for=\"email\">Email</label>"
    assert_equal ::FormsGenerator::Tag.build("div") {}, "<div></div>"
  end
end
