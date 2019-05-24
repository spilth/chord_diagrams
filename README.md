# ChordDiagrams

Generate SVGs of Guitar Chord Diagrams

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chord_diagrams'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chord_diagrams

## Usage

```ruby
require 'chord_diagrams'
puts ChordDiagrams.chord_svg('Am')
```

<svg width="100" height="100" viewBox="0 0 200 200"><text x="100" y="40" text-anchor="middle" style="font-size:36; font-weight:bold">Am</text><line x1="50" y1="80" x2="150" y2="80" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="50" y1="100" x2="150" y2="100" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="50" y1="120" x2="150" y2="120" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="50" y1="140" x2="150" y2="140" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="50" y1="160" x2="150" y2="160" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="50" y1="80" x2="50" y2="160" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="70" y1="80" x2="70" y2="160" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="90" y1="80" x2="90" y2="160" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="110" y1="80" x2="110" y2="160" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="130" y1="80" x2="130" y2="160" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="150" y1="80" x2="150" y2="160" style="stroke:black; stroke-width:2; stroke-linecap:square"/><line x1="49" y1="77" x2="151" y2="77" style="stroke:black; stroke-width:8"/><circle cx="50" cy="61" r="6" style="stroke:black; fill:white; stroke-width:2"/><circle cx="70" cy="61" r="6" style="stroke:black; fill:white; stroke-width:2"/><circle cx="90" cy="110" r="8" style="fill:black"/><circle cx="110" cy="110" r="8" style="fill:black"/><circle cx="130" cy="90" r="8" style="fill:black"/><circle cx="150" cy="61" r="6" style="stroke:black; fill:white; stroke-width:2"/></svg>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spilth/chord_diagrams.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
