# Arch Linux Docker Image for Ansible Role Testing

I use the Dockerfile contained in this repository to build a docker image that
I can use to test Ansible roles on an Arch Linux system. It's based on the
official [Arch Linux docker image](https://hub.docker.com/\_/archlinux/) and
just installs some additionally needed packages. I also had to change the
/etc/pacman.conf file of the official image a little bit, in order to be able
to test a German locale setup.

So far it does not support systemd, but I might add that in the future.

You can find the
[image on dockerhub](https://hub.docker.com/r/schuam/docker\_archlinux\_ansible).

