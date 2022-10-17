### Hexlet tests and linter status:
[![Actions Status](https://github.com/ragmay/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/ragmay/rails-project-63/actions)

[![CI](https://github.com/ragmay/rails-project-63/actions/workflows/master.yml/badge.svg)](https://github.com/ragmay/rails-project-63/actions/workflows/master.yml)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

# FormsGenerator

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/forms_generator`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add forms_generator

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install forms_generator

## Usage

```ruby
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  user = User.new name: "rob", job: "hexlet", gender: "m"

  FormsGenerator.form_for user, url: "/users" do |f|
    f.input :name
    f.input :job, as: :text
  end

# <form action=\"/users\" method=\"post\">
#   <input name=\"name\" type=\"text\" value=\"rob\">
#   <textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>
# </form>

  FormsGenerator.form_for user do |f|
    f.input :name
    f.input :job, as: :text
  end

# <form action=\"#\" method=\"post\">
#   <input name=\"name\" type=\"text\" value=\"rob\">
#   <textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>
# </form>

  FormsGenerator.form_for user, url: "#" do |f|
    f.input :name, class: "user-input"
    f.input :job
  end

#  <form action=\"#\" method=\"post\">
#    <input class=\"user-input\" name=\"name\" type=\"text\" value=\"rob\">
#    <input name=\"job\" type=\"text\" value=\"hexlet\">
#  </form>

  FormsGenerator.form_for user do |f|
    f.input :job, as: :text
  end

#  <form action=\"#\" method=\"post\">
#    <textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea>
#  </form>

  FormsGenerator.form_for user, url: "#" do |f|
    f.input :job, as: :text, rows: 50, cols: 50
  end

#  <form action=\"#\" method=\"post\">
#    <textarea name=\"job\" cols=\"50\" rows=\"50\">hexlet</textarea>
#  </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/forms_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/forms_generator/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FormsGenerator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/forms_generator/blob/master/CODE_OF_CONDUCT.md).
