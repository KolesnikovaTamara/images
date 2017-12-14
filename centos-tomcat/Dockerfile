FROM centos-base:latest
LABEL description="Tomcat image"
ARG java_url=http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jre-8u151-linux-x64.rpm 
ARG tomcat_url=https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz
ARG jmx_remote_url=https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.2/bin/extras/catalina-jmx-remote.jar

RUN curl -L --header "Cookie:oraclelicense=accept-securebackup-cookie"  -o /tmp/jre-8u151-linux-x64.rpm  $java_url && \
    yum -y install /tmp/jre-8u151-linux-x64.rpm && \
    yum clean all &&\
    rm /tmp/jre-8u151-linux-x64.rpm && \
    useradd -d /opt/tomcat/ tomcat && \
    curl -L $tomcat_url | tar -xz -C /opt/tomcat --strip=1 && \
    curl -L $jmx_remote_url -o /opt/tomcat/lib/catalina-jmx-remote.jar && \
    rm -rf /opt/tomcat/webapps/* && \
    chown -R tomcat:tomcat /opt/tomcat/

ENV JAVA_HOME="/usr/java/jre1.8.0_151"
ENV CATALINA_HOME="/opt/tomcat"
