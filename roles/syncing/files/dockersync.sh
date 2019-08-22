#!/usr/bin/env bash
set -xe
rm -rf /tmp/syncthing
mkdir /tmp/syncthing
docker cp -a compose_syncthing_1:/opt/syncthing/ - > /tmp/syncthing/syncthing.tar
sleep 1
tar -xf /tmp/syncthing/syncthing.tar -C /tmp/syncthing
rsync -avz --exclude=local --no-perms --no-owner --no-group --delete /tmp/syncthing/syncthing/ /home/vagrant/syncthing/
docker run --rm  -v syncthing:/opt/syncthing -v /home/vagrant/syncthing:/opt/tosync --user=syncthing compose_syncthing rsync -avz --no-perms --no-owner --no-group --delete /opt/tosync/local/ /opt/syncthing/local/

