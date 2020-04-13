#!/bin/bash

/usr/bin/docker run --rm --name certbot \
      -v "/etc/letsencrypt:/etc/letsencrypt" \
      -v "/root/.ovhapi:/tmp/.ovhapi" \
      -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
      certbot/dns-ovh renew\
      --server https://acme-v02.api.letsencrypt.org/directory \
      --dns-ovh --dns-ovh-credentials /tmp/.ovhapi \
      --dns-ovh-propagation-seconds 10 \
    && /usr/sbin/service nginx reload