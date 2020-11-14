FROM timlaipega/pega:8.3.1
RUN /usr/sbin/groupadd -g 65000 tomcat
RUN /usr/sbin/useradd -d /usr/local/tomcat -g 65000 -u 65000 -s /bin/bash tomcat
COPY docker-entrypoint.sh /scripts/docker-entrypoint.sh
RUN /bin/chown -R tomcat /opt/pega /usr/local/tomcat /scripts
USER tomcat
