# mackerel-rb
[![Gem Version](https://badge.fury.io/rb/mackerel-rb.svg)](http://badge.fury.io/rb/mackerel-rb)
[![Build Status](https://travis-ci.org/pepabo/mackerel-rb.svg)](https://travis-ci.org/pepabo/mackerel-rb)
[![Code Climate](https://codeclimate.com/github/pepabo/mackerel-rb/badges/gpa.svg)](https://codeclimate.com/github/pepabo/mackerel-rb)
[![Dependency Status](https://gemnasium.com/pepabo/mackerel-rb.svg)](https://gemnasium.com/pepabo/mackerel-rb)


## Installation

Add this line to your application's Gemfile:

    gem 'mackerel-rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mackerel-rb

## Usage

```rb
Mackerel.configure do |config|
  config.api_key = "<Your API Key>"               # Default: ENV['MACKEREL_APIKEY']
  config.proxy   = "http://proxy.example.com:80"  # Default: nil (Not use http proxy)
end

hosts = Mackerel.hosts
hosts.each do |host|
  puts host
  #=> #<Hashie::Mash createdAt=1437422856 displayName="www001.mackerel-rb.dev" id="Dummmmmmmmy", ..., status="standby" type="unknown">
end
```

## Feature

#### Services

- [x] List of Services - `GET/api/v0/services`

#### Roles

- [x] List of Roles - `GET/api/v0/services/<serviceName>/roles`

#### Hosts

- [x] Registering host information - `POST/api/v0/hosts`
- [x] Getting host information - `GET/api/v0/hosts/<hostId>`
- [x] Updating host information - `PUT/api/v0/hosts/<hostId>`
- [x] Updating host status - `POST/api/v0/hosts/<hostId>/status`
- [x] Updating host roles - `PUT/api/v0/hosts/<hostId>/role-fullnames`
- [x] Retiring a host - `POST/api/v0/hosts/<hostId>/retire`
- [x] List of hosts - `GET/api/v0/hosts.json`
- [x] Getting host metrics - `GET/api/v0/hosts/<hostId>/metrics`

#### Metrics

- [x] Posting metrics - `POST/api/v0/tsdb`
- [x] Getting latest metrics - `GET/api/v0/tsdb/latest`
- [ ] Posting graph definitions - `POST/api/v0/graph-defs/create`
- [x] Posting service metrics - `POST/api/v0/services/<serviceName>/tsdb`
- [x] Posting monitoring check results - `POST/api/v0/monitoring/checks/report`

#### Monitors

- [ ] Register monitor configurations - `POST/api/v0/monitors`
- [x] Get monitor configurations - `GET/api/v0/monitors`
- [ ] Update monitor configurations - `PUT/api/v0/monitors/<monitorId>`
- [ ] Delete monitor configurations - `DELETE/api/v0/monitors/<monitorId>`

#### Dashboards

- [x] Creating Dashboards - `POST/api/v0/dashboards`
- [x] Getting Dashboards - `GET/api/v0/dashboards/<dashboardId>`
- [x] Updating Dashboards - `PUT/api/v0/dashboards/<dashboardId>`
- [x] Deleting Dashboards - `DELETE/api/v0/dashboards/<dashboardId>`
- [x] List of Dashboards - `GET/api/v0/dashboards`

#### Alerts

- [x] List of Alerts - `GET/api/v0/alerts`
- [x] Closing Alert - `POST/api/v0/alerts/<alertId>/close`

## Contributing

1. Fork it ( https://github.com/pepabo/mackerel-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
