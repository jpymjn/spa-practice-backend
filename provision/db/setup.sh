#!/bin/bash -eu

#
# variables
#
db_name=${SPA_PRACTICE_DB_NAME:?must be specified.}
db_user=${SPA_PRACTICE_DB_USER:?must be specified.}
db_user_password=${SPA_PRACTICE_DB_USER_PASSWORD:?must be specified.}

#
# create db_user
#
if [[ ! $(mysql -e "SELECT 1 FROM mysql.user WHERE user.User = '${db_user}';" ) ]]; then
echo "create db_user..."
mysql -e "
CREATE USER '${db_user}'@'%' IDENTIFIED BY '${db_user_password}';
GRANT ALL ON ${db_name}.* TO '${db_user}'@'%';
"
fi
