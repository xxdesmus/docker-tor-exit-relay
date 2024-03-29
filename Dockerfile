#name of container: docker-tor-exit-relay
#versison of container: 0.5.4
FROM quantumobject/docker-baseimage:15.04
MAINTAINER Angel Rodriguez  "angel@quantumobject.com"

#add repository and update the container
#Installation of nesesary package/software for this containers...
RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main restricted " >> /etc/apt/sources.list
RUN echo "deb http://deb.torproject.org/torproject.org $(lsb_release -sc) main" >> /etc/apt/sources.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89 \
          &&  gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | DEBIAN_FRONTEND=noninteractive apt-key add -
RUN apt-get update && apt-get install -y -q tor \
                    openntpd \
                    deb.torproject.org-keyring \
                    openssh-server \
                    lynx \
                    && apt-get clean \
                    && rm -rf /tmp/* /var/tmp/*  \
                    && rm -rf /var/lib/apt/lists/*

##startup scripts  
#Pre-config scrip that maybe need to be run one time only when the container run the first time .. using a flag to don't 
#run it again ... use for conf for service ... when run the first time ...
RUN mkdir -p /etc/my_init.d
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

##Adding Deamons to containers
RUN mkdir /etc/service/tor
COPY tor.sh /etc/service/tor/run
RUN chmod +x /etc/service/tor/run

RUN mkdir /etc/service/sshd
COPY sshd.sh /etc/service/sshd/run
RUN chmod +x /etc/service/sshd/run

#pre-config scritp for different service that need to be run when container image is create 
#maybe include additional software that need to be installed ... with some service running ... like example mysqld
COPY pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf \
    && /bin/bash -c /sbin/pre-conf \
    && rm /sbin/pre-conf

##scritp that can be running from the outside using docker-bash tool ...
## for example to create backup for database with convitation of VOLUME   dockers-bash container_ID backup_mysql
COPY backup.sh /sbin/backup
RUN chmod +x /sbin/backup
VOLUME /var/backups


#add files and script that need to be use for this container
#include conf file relate to service/daemon 
#additionsl tools to be use internally 
COPY torrc /etc/tor/torrc
RUN mkdir -p /var/run/sshd

# to allow access from outside of the container  to the container service
# at that ports need to allow access from firewall if need to access it outside of the server. 
EXPOSE 22 9050 9001

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
