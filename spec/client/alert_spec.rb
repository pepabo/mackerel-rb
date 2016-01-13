require 'spec_helper'

describe Mackerel::Client::Alert do
  let(:alert_id) { 'DUMMY' }

  describe '.alerts' do
    it 'returns all alerts' do
      stub_api(:get, '/v0/alerts')
      res = Mackerel.alerts
      expect(res).to be_a Array
    end
  end

  describe '.close_alert' do
    it 'returns alert' do
      stub_api(:post, "/v0/alerts/#{alert_id}/close")
      reason = "This is a dummy alert."
      res = Mackerel.close_alert(alert_id, reason: reason)

      expect(res).to be_a Hash
      expect(res.reason).to eq reason
    end
  end
end
