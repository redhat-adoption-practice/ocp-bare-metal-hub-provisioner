#!/bin/bash

# yq must be in your path
# nmstate package must be install

echo "Try generating config..."
yq '.platform.baremetal.hosts.[0].networkConfig' installer_dir/files/install-config.yaml | nmstatectl -vv gc -

echo

echo "Validate config..."
yq '.platform.baremetal.hosts.[0].networkConfig' installer_dir/files/install-config.yaml | nmstatectl -vv validate -
