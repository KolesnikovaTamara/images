FROM tomcat
LABEL description="pmo-tool image"

COPY files ./
RUN chown -R tomcat:tomcat /opt/tomcat/ && \
    sed '/<?xml version="1.0" encoding="UTF-8"?>/a <!DOCTYPE server-xml [<!ENTITY jndi-properties SYSTEM "jndi-properties.xml">]>' -i /opt/tomcat/conf/server.xml && \
    sed '/<GlobalNamingResources>/a \    &jndi-properties;' -i /opt/tomcat/conf/server.xml
USER tomcat
ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]

