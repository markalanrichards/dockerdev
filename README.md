# Experiment - securing dev containers

This is rushed together with the intention of working out a safe way to lock down dev containers with two goals.

It is not production, beta, alpha or potentially even working code (yet).

The container doesn't execute directly in the host, but instead in a vm (in this case in a container in a vm).

The container that publishes an http server, should be assumed to be insecure, if a rogue DNS entry to 127.0.0.1 attempted to reach the server in the default web browsing session, it would fail.

I've taken Syncthing as an example app where there's a need to sync data accross.


