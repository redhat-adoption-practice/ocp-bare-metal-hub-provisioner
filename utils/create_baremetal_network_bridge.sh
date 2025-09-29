#!/bin/bash

PUB_CONN=${1:-eno5np0}

sudo nohup bash -c "
    nmcli con down \"$PUB_CONN\"
    nmcli con delete \"$PUB_CONN\"
    nmcli connection add ifname baremetal type bridge con-name baremetal bridge.stp no
    nmcli con add type bridge-slave ifname \"$PUB_CONN\" master baremetal
"

