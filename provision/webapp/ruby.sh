#!/bin/bash -eu

#
# variables
#
app_user=${SPA_PRACTICE_APP_USER:?must be specified.}
ruby_version=2.6.5

#
# install yum packages
#
yum install -y git gcc openssl-devel readline-devel

#
# install ruby2.6.5 with rbenv
# https://github.com/rbenv/rbenv#basic-github-checkout
#
if [ ! -e /home/${app_user}/.rbenv ]; then
sudo -u ${app_user} bash -c "git clone https://github.com/rbenv/rbenv.git ~/.rbenv"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/${app_user}/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/${app_user}/.bash_profile
sudo -u ${app_user} bash -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
sudo -u ${app_user} bash -c "sudo ~/.rbenv/plugins/ruby-build/install.sh"
sudo -u ${app_user} bash --login -c "rbenv install ${ruby_version}"
sudo -u ${app_user} bash --login -c "rbenv global ${ruby_version}"
fi

#
# install gems
#
sudo -u ${app_user} bash --login -c "gem install bundler"
