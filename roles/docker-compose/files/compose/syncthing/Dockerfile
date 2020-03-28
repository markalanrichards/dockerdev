FROM debian:buster-slim

RUN apt-get update \
 && apt-get autoremove -y
 && apt-get dist-upgrade -y
 
RUN apt-get install gnupg2 apt-transport-https curl -y \
 && curl -s https://syncthing.net/release-key.txt | apt-key add - \
 && echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list \
 && apt-get update \
 && apt-get install syncthing rsync -y
 
RUN useradd -ms /bin/bash syncthing

RUN mkdir /opt/syncthing && chown syncthing /opt/syncthing
RUN mkdir /opt/tosync && chown syncthing /opt/tosync

SHELL ["/bin/bash", "-l", "-c"]

CMD su -l -c 'syncthing -home="/opt/syncthing" -gui-address="http://0.0.0.0:8080"' syncthing

