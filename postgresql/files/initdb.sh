#!/bin/sh
PGDATA=/var/lib/pgsql/9.6/data
if [ ! "$(ls -A $PGDATA)" ]; then
    touch /var/lib/pgsql/9.6/logfile
    /usr/pgsql-9.6/bin/pg_ctl init -D $PGDATA
    sed "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" -i $PGDATA/postgresql.conf
    printf "local   all all         peer\nhost    all all 0.0.0.0/0 md5\n" > $PGDATA/pg_hba.conf
    /usr/pgsql-9.6/bin/pg_ctl -w  -D $PGDATA -l /var/lib/pgsql/9.6/logfile start
    psql -c "CREATE USER $db_user WITH PASSWORD '"$db_password"';"
    psql -c "CREATE DATABASE $db_name OWNER $db_user;"
else
   usr/pgsql-9.6/bin/pg_ctl -w  -D $PGDATA -l /var/lib/pgsql/9.6/logfile start
fi
tail -f /var/lib/pgsql/9.6/logfile
