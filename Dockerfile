FROM pegasystems/pega:8.4.0
RUN /usr/sbin/groupadd -g 1000 tomcat
RUN /usr/sbin/useradd -d /usr/local/tomcat -g 1000 -u 1000 -s /bin/bash tomcat
RUN /bin/chown -R tomcat.tomcat /opt/pega /usr/local/tomcat /scripts
USER tomcat
