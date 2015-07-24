#!/usr/bin/env ruby

Vagrant.configure(2) do |config|
  config.vm.define 'www001.mackerel-rb.dev' do
    config.vm.box = "puppetlabs/centos-7.0-64-puppet"
    config.vm.hostname = 'www001.mackerel-rb.dev'
    config.vm.network "private_network", ip: '192.168.33.2'
    config.vm.provision :shell, inline: <<-SHELL
curl -fsSL https://mackerel.io/assets/files/scripts/setup-yum.sh | sh
sudo yum install -y mackerel-agent
sudo cat << 'EOF' > /etc/mackerel-agent/mackerel-agent.conf
apikey="#{ENV['MACKEREL_APIKEY']}"
EOF
sudo /etc/init.d/mackerel-agent restart
    SHELL

    config.vm.provider "virtualbox" do |vb|
      vb.name = 'www001.mackerel-rb.dev'
      vb.memory = 512
      vb.cpus = 1
    end
  end
end
