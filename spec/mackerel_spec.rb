require 'spec_helper'

describe Mackerel do
  let(:host_id) { 'DUMMY' }

  shared_examples_for 'a host' do
    it do
      expect(host).to           be_a Hash
      expect(host.id).to        be_a String
      expect(host.memo).to      be_a String
      expect(host.meta).to      be_a Hash
      expect(host.roles).to     be_a Hash
      expect(host.createdAt).to be_a Integer
    end
  end

  describe '.#respond_to' do
    subject { described_class }

    it { is_expected.to be_respond_to(:hosts) }
    it { is_expected.to be_respond_to(:host) }
    it { is_expected.to be_respond_to(:create_host) }
    it { is_expected.to be_respond_to(:update_host) }
    it { is_expected.to be_respond_to(:retire_host) }
    it { is_expected.to be_respond_to(:host_metrics) }
    it { is_expected.to be_respond_to(:update_host_status) }
    it { is_expected.to be_respond_to(:create_tsdb) }
    it { is_expected.to be_respond_to(:create_metrics) }
    it { is_expected.to be_respond_to(:latest_tsdb) }
    it { is_expected.to be_respond_to(:latest_metrics) }
    it { is_expected.to be_respond_to(:create_service_tsdb) }
    it { is_expected.to be_respond_to(:create_service_metrics) }
    it { is_expected.to be_respond_to(:create_monitoring_check_report) }
  end

  it 'has a version number' do
    expect(Mackerel::VERSION).not_to be nil
  end

  describe '.#hosts' do
    before do
      stub_api(:get, '/v0/hosts.json')
    end

    subject { hosts }

    let!(:hosts) do
      described_class.hosts
    end

    let(:host) { hosts[0] }

    it do
      is_expected.to be_a Array
     end

    it_should_behave_like 'a host'
  end

  describe '.#host' do
    before do
      stub_api(:get, "/v0/hosts/#{host_id}")
    end

    let!(:host) {
      described_class.host(host_id)
    }

    it_should_behave_like 'a host'
  end

  describe '.#update_host_status' do
    before do
      stub_api(:post, "/v0/hosts/#{host_id}/status")
    end

    let!(:host_status) {
      described_class.update_host_status(host_id, status: 'standby')
    }

    it do
      expect(host_status).to be_a Hash
      expect(host_status.success).to be_truthy
    end
  end

  describe '.#host_metrics' do
    let(:host_id) { 'METRICS_DUMMY' }
    before do
      stub_api(:get, "/v0/hosts/#{host_id}/metrics?name=loadavg5")
    end

    let!(:host_metrics) {
      described_class.host_metrics(host_id, name: "loadavg5")
    }

    it do
      expect(host_metrics).to be_a Hash
    end
  end

  describe '.#latest_tsdb' do
    before do
      stub_api(:get, "/v0/tsdb/latest?hostId=DUMMY&name=loadavg5")
    end

    let!(:tsdb) {
      described_class.latest_tsdb(hostId: [host_id], name: ['cpu.user.percentage', 'loadavg5'])
    }

    it do
      expect(tsdb).to be_a Hash
      expect(tsdb).to respond_to host_id
      expect(tsdb[host_id]).to respond_to 'loadavg5'
      expect(tsdb[host_id]).to respond_to 'cpu.user.percentage'
    end
  end
end
