# tor-relay container
# VERSION               0.0.2
FROM angelrr7702/ubuntu-13.10-sshd
MAINTAINER Angel Rodriguez  "angelrr7702@gmail.com"
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy-backports main restricted " >> /etc/apt/sources.list
RUN echo "deb http://deb.torproject.org/torproject.org saucy main" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN (gpg --keyserver keys.gnupg.net --recv 886DDD89 && gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -)
RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
RUN apt-get install -y -q tor supervisor openntpd
ADD torrc /etc/tor/torrc
ADD start.sh /start.sh
RUN chmod 750 /start.sh
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 9050 9001
CMD ["/bin/bash", "-e", "/start.sh"] 
