# ChordDiagrams [![Build Status](https://www.travis-ci.com/spilth/chord_diagrams.svg?branch=master)](https://www.travis-ci.com/spilth/chord_diagrams)

Generate SVGs for Guitar and Ukulele Chord Diagrams

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chord_diagrams'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install chord_diagrams
```

## Usage

```ruby
require 'chord_diagrams'
puts ChordDiagrams.guitar_svg('Am')
puts ChordDiagrams.ukulele_svg('Am')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spilth/chord_diagrams.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
