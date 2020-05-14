# LargeFileLinux

Ruby class to read large files on 32 bit Linux platforms.

[![Gem Version](https://badge.fury.io/rb/large_file_linux.svg)](http://badge.fury.io/rb/large_file_linux)
[![Build Status](https://travis-ci.org/ManageIQ/large_file_linux.svg)](https://travis-ci.org/ManageIQ/large_file_linux)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'large_file_linux'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install large_file_linux

## Usage

LargeFileLinux supports `#read`, `#write`, `#seek`, `#size`, and `#close`, much
like the Ruby `File` class.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ManageIQ/large_file_linux.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

