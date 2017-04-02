FROM ubuntu:latest


RUN apt-get update && apt-get install -y software-properties-common python-software-properties && \
	add-apt-repository ppa:certbot/certbot && \
	apt-get update && \
	apt-get install -y certbot 

VOLUME /etc/letsencrypt
VOLUME /znc

COPY cert.sh /cert.sh

RUN chmod +x /cert.sh

CMD ["/cert.sh"]

