#!/usr/bin/env bash
set -xe
rm -rf /dev/shm/syncthing
mkdir /dev/shm/syncthing
docker cp -a compose_syncthing_1:/opt/syncthing/ - > /dev/shm/syncthing/syncthing.tar
sleep 1
tar -xf /dev/shm/syncthing/syncthing.tar -C /dev/shm/syncthing
rsync -avz --exclude=local --no-perms --no-owner --no-group --delete /dev/shm/syncthing/syncthing/ /home/vagrant/syncthing/
docker run --rm  -v syncthing:/opt/syncthing -v /home/vagrant/syncthing:/opt/tosync --user=syncthing compose_syncthing rsync -avz --exclude=.stfolder --exclude=.stignore --no-perms --no-owner --no-group --delete /opt/tosync/local/ /opt/syncthing/local/

