FROM centos-base
LABEL description="Postgresql image"
ARG postgresql_rpm=https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
ARG PGDATA=/var/lib/pgsql/9.6/data/
ARG db_name=
ARG db_user=
ARG db_password=
COPY files/entrypoint.sh /
RUN yum -y install $postgresql_rpm && \
    yum -y install postgresql96 postgresql96-server && \
    yum clean all &&\
    chown -R postgres:postgres \entrypoint.sh
USER  postgres
ENV db_name=${db_name}
ENV db_user=${db_user}
ENV db_password=${db_password}
#RUN cd /var/lib/pgsql/9.6 && touch logfile &&\
#    /usr/pgsql-9.6/bin/pg_ctl init -D $PGDATA &&\
#    sed "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" -i $PGDATA/postgresql.conf
#COPY files/pg_hba.conf $PGDATA/pg_hba.conf
#COPY files/entrypoint.sh  /entrypoint.sh	
ENTRYPOINT ["/entrypoint.sh"]
