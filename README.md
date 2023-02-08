# OpenShift Hybrid Ansible

This repostiory contains an Ansible-based framework for deploying and updating
OpenShift clusters using User-Provisioned Infrastructure (UPI) across multiple platforms.

Currently, the supported platforms are vSphere, Dell iDRAC, and HPE iLO with the assumption that
control plane nodes will run on vSphere and worker nodes will be a mix of metal and vSphere machines.

## Legal Stuff

All protectable content in this repository is Copyright 2023 by Red Hat and contributors
and is made available under the Apache License, Version 2.0. A complete copy of the
license is available in the LICENSE file.
