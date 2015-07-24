$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mackerel-rb'
require 'webmock/rspec'

ENV['MACKEREL_APIKEY'] ||= 'DUMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMY='

def stub_api(method, path)
  url = "https://mackerel.io/api#{path}"
  file = url.gsub('https://', "spec/fixtures/#{method}/").sub(/\?.+$/, '')
  stub_request(method, url).to_return(status: 200, body: File.read(file))
end
