# Aparcamiento

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/Aparcamiento`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add Aparcamiento

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install Aparcamiento

## Usage

This gem is used to represent a parking lot. Initially, two modules are created, one called "Funcionalidades" and another called "Aparcamiento". In the parking module there are the main classes.
The "Datos" class stores the parking data,
From the "Datos" class, an inheritance from the "Aeropuerto" and "EstacionTren" classes is highlighted, where the concept of polymorphism is applied using the enumerable module.
The space class stores the spaces that a car park can have and an inheritance is made with the "PlazaMinusvalido" class, which has one of the default values.
The "Vehiculo" class stores the data of a vehicle and from that class the "Motor" class is inherited


## Developmet Gem
To carry out its development, the TDD (Test-Driven-Development) development methodology is applied and documentation was generated with the yard gem

## Development
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Aparcamiento. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/Aparcamiento/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Aparcamiento project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Aparcamiento/blob/master/CODE_OF_CONDUCT.md).



---
---
#### Author: Fabrizzio Daniell Perilli Martín
#### Email: alu0101138589@ull.edu.es

