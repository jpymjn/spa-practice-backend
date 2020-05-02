#!/bin/bash -eu

#
# variables
#
# some_var=${SOME_VAR:?must be specified.}

#
# install amazon-linux-extras packages
#
amazon-linux-extras install nginx1

#
# enable and restart service
#
systemctl enable nginx
systemctl restart nginx
