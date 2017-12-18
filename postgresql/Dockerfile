FROM centos-base
LABEL description="Postgresql image"
ARG postgresql_rpm=https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
ARG PGDATA=/var/lib/pgsql/9.6/data/
ARG db_name=***REMOVED***
ARG db_user=***REMOVED***
ARG db_password=***REMOVED***
COPY files ./
RUN yum -y install $postgresql_rpm && \
    yum -y install postgresql96 postgresql96-server && \
    yum clean all &&\
    chown -R postgres:postgres \entrypoint.sh
USER  postgres
ENV db_name=${db_name}
ENV db_user=${db_user}
ENV db_password=${db_password}
USER root
ENTRYPOINT ["/entrypoint.sh"]
