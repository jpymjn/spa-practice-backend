# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #
  # plugins
  #
  # plugins
  config.vagrant.plugins = ["vagrant-hostmanager"]
  # hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  #
  # webappサーバ
  #
  config.vm.define "webapp" do |webapp|
    webapp.vm.hostname = "spa-practice.example.com"
    webapp.vm.box = "bento/amazonlinux-2"
    webapp.vm.network "private_network", ip: "192.168.33.10"

    #
    # provision
    #
    # /etc/environment の配置
    webapp.vm.provision "file", source: "./provision/environment/local", destination: "/tmp/environment.local"
    webapp.vm.provision "shell", inline: <<-SHELL
      mv -f /tmp/environment.local /etc/environment
    SHELL
    # provisionタスク
    webapp.vm.provision "shell", path: "./provision/webapp/nginx.sh"
    webapp.vm.provision "shell", path: "./provision/webapp/ruby.sh"
    webapp.vm.provision "shell", path: "./provision/webapp/mariadb.sh"
  end

  #
  # dbサーバ
  #
  config.vm.define "db" do |db|
    db.vm.hostname = "db.spa-practice.example.com"
    db.vm.box = "bento/amazonlinux-2"
    db.vm.network "private_network", ip: "192.168.33.11"

    #
    # provision
    #
    # /etc/environment の配置
    db.vm.provision "file", source: "./provision/environment/local", destination: "/tmp/environment.local"
    db.vm.provision "shell", inline: <<-SHELL
      mv -f /tmp/environment.local /etc/environment
    SHELL
    # provisionタスク
    db.vm.provision "shell", path: "./provision/db/mariadb-server.sh"
    db.vm.provision "shell", path: "./provision/db/setup.sh"
  end
end
