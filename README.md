[![Build Status](https://travis-ci.org/t27duck/raw_to_a.svg?branch=master)](https://travis-ci.org/t27duck/raw_to_a)

# RawToA

`raw_to_a` implements a method on `ActiveRecord` to return an array of hashes directly from a query instead of `ActiveRecord` objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'raw_to_a'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install raw_to_a

## Usage

Similar to `to_a`, you can call `raw_to_a` on any `ActiveRecord`/`ActiveRelation` query, but instead of an array of `ActiveRecord` objects, you get an array of hashes.

```ruby
  > User.where(active: true).raw_to_a
  => [{username: 'user1', active: true, password_crypted: '...'}, ...]
```

```ruby
  > User.select(:username).raw_to_a
  => [{username: 'user1'}, {username: 'user2'}, ...]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/t27duck/raw_to_a.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

