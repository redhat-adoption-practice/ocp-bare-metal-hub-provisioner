# OCP Bare-metal Hub Provisioner

Automation for preparing for and provisioning Red Hat OpenShift Container Platform hub clusters on bare metal.

## Tested Hardware

* Dell iDRAC 
* HPE iLO

## Instructions

1. ssh to bare-metal host to be used as provisioner
   * host must be bare-metal or support nested virtulization
2. prepare provisioner node network
    ```
    ./utils/create_baremetal_network_bridge.sh PUBLIC_CONNECTION_NAME
    ```
3. TODO
