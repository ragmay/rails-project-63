# frozen_string_literal: true

require "test_helper"

class TestFormsGenerator < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::FormsGenerator::VERSION
  end

  def test_forms_generator_form_without_url
    user = User.new name: "rob"
    ready_made_form = take_fixture("/fixtures/form_without_url.html")
    generated_form = FormsGenerator.form_for user

    assert_equal generated_form, ready_made_form
  end

  def test_forms_generator_form_with_url
    user = User.new name: "rob"
    ready_made_form = take_fixture("/fixtures/form_with_url.html")
    generated_form = FormsGenerator.form_for user, url: "/users"

    assert_equal generated_form, ready_made_form
  end

  def test_forms_generator_form_with_button_and_label
    user = User.new job: "hexlet"
    ready_made_form = take_fixture("/fixtures/form_with_button_and_label.html")

    generated_form =
      FormsGenerator.form_for user do |f|
        f.input :name
        f.input :job
        f.submit
      end

    assert_equal generated_form, ready_made_form
  end

  def test_forms_generator_form_with_button_with_label_and_label
    user = User.new job: "hexlet"
    ready_made_form = take_fixture("/fixtures/form_with_button_with_label_and_label.html")

    generated_form =
      FormsGenerator.form_for user, url: "#" do |f|
        f.input :name
        f.input :job
        f.submit "Wow"
      end

    assert_equal generated_form, ready_made_form
  end

  private

  def take_fixture(path)
    File.new(File.dirname(__FILE__) + path).read.strip
  end
end
