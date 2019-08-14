FROM debian:buster-slim

RUN apt-get update \
 && apt-get dist-upgrade -y

RUN apt-get install squid curl -y

SHELL ["/bin/bash", "-l", "-c"]

ADD /ca /ca

RUN sed -i 's/http_access deny all/acl to_ipv6 dst ipv6\nacl from_ipv6 src ipv6\nhttp_access allow all\nhttp_access deny all/g' /etc/squid/squid.conf

RUN sed -i 's/http_port 3128/https_port 8443 tls-cert=\/ca\/server\/client-ssl.dockerdev.local.crt tls-key=\/ca\/server\/client-ssl.dockerdev.local.key tls-cafile=\/ca\/ca\/ca.crt/g' /etc/squid/squid.conf

RUN sed -i 's/# dns_v4_first off/dns_v4_first on/g' /etc/squid/squid.conf


CMD apt-get update && apt-get dist-upgrade -y && squid --foreground
