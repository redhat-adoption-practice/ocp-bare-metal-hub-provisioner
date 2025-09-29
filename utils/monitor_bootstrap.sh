#!/bin/bash

# Monitor the cluster-bootstrap pod on the VM

#Assumes an entry in ~/.ssh/config something like:
#
#Host bootstrap
#  Hostname <ip of bootstrap>
#  User core
#  IdentityFile /home/<username>/.ssh/kni_id_ed25519

until ssh -o ConnectTimeout=5 bootstrap "sudo /bin/bash -c 'while :; do podman logs -f cluster-bootstrap ; echo ; ps fauxww | grep podman ; echo ; podman ps ; sleep 15 ; done'" ; do sleep 5 ; done
