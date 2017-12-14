#!/bin/sh
echo $db_user
echo $db_password
/usr/pgsql-9.6/bin/pg_ctl -w  -D /var/lib/pgsql/9.6/data -l /var/lib/pgsql/9.6/logfile start  && \
psql -c "CREATE USER $db_user WITH PASSWORD '"$db_password"';"
psql -c "CREATE DATABASE $db_name OWNER $db_user;"
tail -f /var/lib/pgsql/9.6/logfile 
