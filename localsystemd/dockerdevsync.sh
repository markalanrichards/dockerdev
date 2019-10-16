#!/usr/bin/env bash
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/local/ vagrant@dockerdev.local:/home/vagrant/syncthing/local/
rsync -avz --exclude=local --exclude=cert.pem --exclude=https-cert.pem  --exclude=https-key.pem --exclude=key.pem --no-perms --no-owner --no-group --delete  vagrant@dockerdev.local:/home/vagrant/syncthing/ /home/mark/syncthing/

rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/cert.pem vagrant@dockerdev.local:/home/vagrant/syncthing/cert.pem
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/https-cert.pem vagrant@dockerdev.local:/home/vagrant/syncthing/https-cert.pem
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/key.pem vagrant@dockerdev.local:/home/vagrant/syncthing/key.pem
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/https-key.pem vagrant@dockerdev.local:/home/vagrant/syncthing/https-key.pem

rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/cert.pem vagrant@dockerdev.local:/home/vagrant/syncthing/cert.pem
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/https-cert.pem vagrant@dockerdev.local:/home/vagrant/syncthing/https-cert.pem
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/key.pem vagrant@dockerdev.local:/home/vagrant/syncthing/key.pem
rsync -avz --no-perms --no-owner --no-group --delete /home/mark/syncthing/https-key.pem vagrant@dockerdev.local:/home/vagrant/syncthing/https-key.pem

rsync -avz --no-perms --no-owner --no-group --ignore-existing vagrant@dockerdev.local:/home/vagrant/syncthing/cert.pem /home/mark/syncthing/cert.pem 
rsync -avz --no-perms --no-owner --no-group --ignore-existing vagrant@dockerdev.local:/home/vagrant/syncthing/https-cert.pem /home/mark/syncthing/https-cert.pem 
rsync -avz --no-perms --no-owner --no-group --ignore-existing vagrant@dockerdev.local:/home/vagrant/syncthing/key.pem /home/mark/syncthing/key.pem 
rsync -avz --no-perms --no-owner --no-group --ignore-existing vagrant@dockerdev.local:/home/vagrant/syncthing/https-key.pem /home/mark/syncthing/https-key.pem 
