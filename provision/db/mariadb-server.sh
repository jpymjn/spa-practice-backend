#!/bin/bash -eu

#
# variables
#
# some_var=${SOME_VAR:?must be specified.}

#
# install yum packages
#
yum install -y mariadb-server

#
# enable and restart service
#
systemctl enable mariadb
systemctl restart mariadb
