#!/bin/bash

while true; do

if [ -f /etc/letsencrypt/live/${DOMAIN}/privkey.pem ]; then
	certbot renew -q && cat /etc/letsencrypt/live/${DOMAIN}/{privkey,cert,chain}.pem > /znc/znc.pem
else
	certbot certonly --standalone --preferred-challenges http -d "$DOMAIN" --email "$EMAIL" --agree-tos && \
	cat /etc/letsencrypt/live/${DOMAIN}/{privkey,cert,chain}.pem > /znc/znc.pem
fi


sleep 1d

done
