# AflSchedule

Simple gem to facilitate using the AFL fixture data in apps

## Installation

Add this line to your application's Gemfile:

    gem 'afl_schedule'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install afl_schedule

## Usage

    require 'afl_schedule'

    AFL::Schedule.new.next_match('Essendon')
    => #<OpenStruct home_team="Essendon ", away_team="Melbourne", venue="MCG", time=2013-06-04 19:40:00 +1000>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
