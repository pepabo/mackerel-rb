# mackerel-rb

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mackerel-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mackerel-rb

## Usage

```ruby
hosts = Mackerel.hosts
hosts.each do |host|
  puts host
end

## Feature

- [x]  GET  /api/v0/hosts.json
- [x]  POST /api/v0/hosts
- [x]  GET  /api/v0/hosts/<hostId>
- [x]  PUT  /api/v0/hosts/<hostId>
- [x]  POST /api/v0/hosts/<hostId>/status
- [x]  POST /api/v0/hosts/<hostId>/retire
- [ ]  POST /api/v0/tsdb
- [x]  GET  /api/v0/tsdb/latest
- [ ]  POST /api/v0/services/<serviceName>/tsdb
- [ ]  POST /api/v0/monitoring/checks/report

## Contributing

1. Fork it ( https://github.com/mizoR/mackerel-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
