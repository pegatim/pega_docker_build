FROM timlaipega/pega:8.3.1
RUN /usr/sbin/groupadd -g 65000 tomcat
RUN /usr/sbin/useradd -d /usr/local/tomcat -g 65000 -u 65000 -s /bin/bash tomcat
COPY ./docker-entrypoint.sh /scripts/
RUN /bin/chown -R tomcat.root /opt/pega /usr/local/tomcat /scripts /search_index
RUN /bin/chmod -R 775 /opt/pega /usr/local/tomcat /scripts /search_index
USER tomcat
