# mackerel-rb
[![Build Status](https://travis-ci.org/mizoR/mackerel-rb.svg)](https://travis-ci.org/mizoR/mackerel-rb)
[![Code Climate](https://codeclimate.com/github/mizoR/mackerel-rb/badges/gpa.svg)](https://codeclimate.com/github/mizoR/mackerel-rb)
[![Dependency Status](https://gemnasium.com/mizoR/mackerel-rb.svg)](https://gemnasium.com/mizoR/mackerel-rb)


## Installation

Add this line to your application's Gemfile:

    $ gem 'mackerel-rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mackerel-rb

## Usage

```rb
Mackerel.configure do |config|
  config.api_key = "<Your API Key>"   # Default: ENV['MACKEREL_APIKEY']
end

hosts = Mackerel.hosts
hosts.each do |host|
  puts host
  #=> #<Hashie::Mash createdAt=1437422856 displayName="www001.mackerel-rb.dev" id="Dummmmmmmmy", ..., status="standby" type="unknown">
end
```

## Feature

- [x]  `GET  /api/v0/hosts.json`
- [x]  `POST /api/v0/hosts`
- [x]  `GET  /api/v0/hosts/<hostId>`
- [x]  `PUT  /api/v0/hosts/<hostId>`
- [x]  `POST /api/v0/hosts/<hostId>/status`
- [x]  `POST /api/v0/hosts/<hostId>/retire`
- [ ]  `POST /api/v0/tsdb`
- [x]  `GET  /api/v0/tsdb/latest`
- [ ]  `POST /api/v0/services/<serviceName>/tsdb`
- [ ]  `POST /api/v0/monitoring/checks/report`

## Contributing

1. Fork it ( https://github.com/mizoR/mackerel-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
