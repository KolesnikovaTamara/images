#!/bin/sh
#echo $db_user
#echo $db_password
chown postgres:postgres /var/lib/pgsql/9.6/data/
su postgres -c "sh ./initdb.sh"
