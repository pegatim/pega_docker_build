FROM timlaipega/pega:8.3.1
RUN /usr/sbin/groupadd -g 65000 pegauser
RUN /usr/sbin/useradd -d /usr/local/tomcat -g 65000 -u 65000 -s /bin/bash pegauser
COPY ./docker-entrypoint.sh /scripts/
COPY ./setenv.sh /usr/local/tomcat/bin/
COPY ./server.xml /usr/local/tomcat/conf/
#COPY ./keystore.p12 /usr/local/tomcat/.keystore.p12
#COPY ./myCA.pem /usr/share/ca-certificates/mozilla/
#COPY ./myCA.pem /etc/ssl/certs/
COPY ./localhost.pem /etc/ssl/certs/
RUN /bin/chown -R pegauser.root /opt/pega /usr/local/tomcat /scripts /search_index
RUN /bin/chmod -R 775 /opt/pega /usr/local/tomcat /scripts /search_index 
USER pegauser
