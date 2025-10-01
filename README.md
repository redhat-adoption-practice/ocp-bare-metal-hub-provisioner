# OCP Bare-metal Hub Provisioner

Automation for preparing for and provisioning Red Hat OpenShift Container Platform hub clusters on bare metal.

## Tested Hardware

* Dell iDRAC
* HPE iLO

## Instructions

### Prepare Inventory
Sample inventories are separated from this repository for ease of separation of concerns.

1. if not already done for your organization make a copy of the [ocp-bare-metal-hub-provisioner-inventories](https://github.com/redhat-adoption-practice/ocp-bare-metal-hub-provisioner-inventories) template
2. update your copy of [ocp-bare-metal-hub-provisioner-inventories](https://github.com/redhat-adoption-practice/ocp-bare-metal-hub-provisioner-inventories) for the new cluster

### Prepare Provisioner Host

1. ssh to bare-metal host to be used as provisioner
   * host must be bare-metal or support nested virtualization
2. prepare provisioner node network
    ```
    ./utils/create_baremetal_network_bridge.sh PUBLIC_CONNECTION_NAME
    ```
3. TODO

### Provision Cluster

1. TODO
