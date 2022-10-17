# frozen_string_literal: true

require "test_helper"

class TestFormsGenerator < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::FormsGenerator::VERSION
  end

  def test_tag_build
    assert_equal ::FormsGenerator::Tag.build("br"), "<br>"
    assert_equal ::FormsGenerator::Tag.build("img", src: "path/to/image"), "<img src=\"path/to/image\">"
    assert_equal ::FormsGenerator::Tag.build("input", type: "submit", value: "Save"),
                 "<input type=\"submit\" value=\"Save\">"
    assert_equal ::FormsGenerator::Tag.build("label") { "Email" }, "<label>Email</label>"
    assert_equal ::FormsGenerator::Tag.build("label", for: "email") {
                   "Email"
                 }, "<label for=\"email\">Email</label>"
    assert_equal ::FormsGenerator::Tag.build("div"), "<div>"
  end

  def test_forms_generator_form_without_url
    user = User.new name: "rob"
    form = "<form action=\"#\" method=\"post\"></form>"

    result =
      FormsGenerator.form_for user

    assert_equal result, form
  end

  def test_forms_generator_form_with_url
    user = User.new name: "rob"
    form = "<form action=\"/users\" method=\"post\"></form>"

    result =
      FormsGenerator.form_for user, url: "/users"

    assert_equal result, form
  end

  def test_forms_generator_form_with_fields1
    user = User.new name: "rob", job: "hexlet", gender: "m"

    form = "<form action=\"/users\" method=\"post\">\
<input name=\"name\" type=\"text\" value=\"rob\">\
<textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>\
</form>"

    result =
      FormsGenerator.form_for user, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
      end

    assert_equal result, form
  end

  def test_forms_generator_form_with_fields2
    user = User.new name: "rob", job: "hexlet", gender: "m"

    form = "<form action=\"#\" method=\"post\">\
<input class=\"user-input\" name=\"name\" type=\"text\" value=\"rob\">\
<input name=\"job\" type=\"text\" value=\"hexlet\">\
</form>"

    result =
      FormsGenerator.form_for user, url: "#" do |f|
        f.input :name, class: "user-input"
        f.input :job
      end

    assert_equal result, form
  end

  def test_forms_generator_form_with_fields3
    user = User.new name: "rob", job: "hexlet", gender: "m"

    form = "<form action=\"#\" method=\"post\">\
<textarea name=\"job\" cols=\"50\" rows=\"50\">hexlet</textarea>\
</form>"

    result =
      FormsGenerator.form_for user, url: "#" do |f|
        f.input :job, as: :text, rows: 50, cols: 50
      end

    assert_equal result, form
  end
end
