require 'spec_helper'

describe Mackerel::Client::Dashboard do
  let(:dashboard_id) { 'DUMMY' }

  describe '.dashboards' do
    it 'returns all dashboards' do
      stub_api(:get, '/v0/dashboards')
      res = Mackerel.dashboards
      expect(res).to be_a Array
    end
  end

  describe '.dashboard' do
    it 'returns dashboard' do
      stub_api(:get, "/v0/dashboards/#{dashboard_id}")
      res = Mackerel.dashboard(dashboard_id)
      expect(res).to be_a Hash
    end
  end

  describe '.create_dashboard' do
    it 'returns dashboard' do
      stub_api(:post, '/v0/dashboards')
      res = Mackerel.create_dashboard(
        title: 'My Dashboard',
        bodyMarkdown: '# A test dashboard',
        urlPath: '2u4PP3TJqbu'
      )
      expect(res).to be_a Hash
    end
  end

  describe '.update_dashboard' do
    it 'returns dashboard' do
      stub_api(:put, "/v0/dashboards/#{dashboard_id}")
      res = Mackerel.update_dashboard(dashboard_id,
        title: 'My Dashboard',
        bodyMarkdown: '# A test dashboard',
        urlPath: '2u4PP3TJqbu'
      )
      expect(res).to be_a Hash
    end
  end

  describe '.delete_dashboard' do
    it 'returns dashboard' do
      stub_api(:delete, "/v0/dashboards/#{dashboard_id}")
      res = Mackerel.delete_dashboard(dashboard_id)
      expect(res).to be_a Hash
    end
  end
end
