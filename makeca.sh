#!/usr/bin/env bash
set -xe
: ${ca_crt:=./ca/ca.crt}
: ${ca_key:=./ca/ca.key}

if [ ! -f $ca_crt ] || [ ! -f $ca_key ]; then
    rm -rf ./ca
    mkdir ca
    openssl genrsa -passout pass:mycert -aes256 -out $ca_key 4096
    chmod 400 $ca_key
    openssl req -new -x509 -sha256 -days 730 -key $ca_key -passin pass:mycert -out $ca_crt \
        -subj "/C=GB/ST=GB/L=/O=/OU=/CN=Mark Richards/emailAddress="
    chmod 444 $ca_crt
fi

: ${domain:=$1}
server_key=server/client-ssl.${domain}.key
server_csr=server/client-ssl.${domain}.csr
server_crt=server/client-ssl.${domain}.crt
if [ ! -f $server_csr ] || [ ! -f $server_key ] || [ ! -f $server_crt ]; then
    rm -rf ./server
    mkdir server
    openssl genrsa -passout pass:mycert -out $server_key 4096
    chmod 400 $server_key
    openssl req -new -passin pass:mycert -key $server_key -sha256 -out $server_csr \
      -subj "/C=GB/ST=GB/L=/O=/OU=/CN=$domain/emailAddress="
    openssl x509 -req -days 365 -sha256 -in $server_csr -CA $ca_crt -passin pass:mycert -CAkey $ca_key -set_serial 1 -out $server_crt
    chmod 444 $server_crt
fi

: ${client:=dev}
client_key=client/${client}.key
client_csr=client/${client}.csr
client_crt=client/${client}.crt

if [ ! -f $client_csr ] || [ ! -f $client_key ] || [ ! -f $client_crt ]; then
    rm -rf ./client
    mkdir client
    openssl genrsa -passout pass:mycert  -out $client_key 4096
    openssl req -new -passin pass:mycert -key $client_key -out $client_csr \
      -subj "/C=GB/ST=GB/L=/O=/OU=/CN=$client/emailAddress="
    openssl x509 -req -days 365 -sha256 -in $client_csr -CA $ca_crt -passin pass:mycert -CAkey $ca_key -set_serial 2 -out $client_crt
fi 
