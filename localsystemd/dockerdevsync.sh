#!/usr/bin/env bash
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/local/ vagrant@dockerdev.local:/home/vagrant/syncthing/local


