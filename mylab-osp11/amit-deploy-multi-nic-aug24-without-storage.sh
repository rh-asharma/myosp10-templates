#!/bin/bash

source ~/stackrc

now=$(date +%F-%T)

openstack overcloud deploy --templates -e /home/stack/templates/amit-multi-nic-network-environment-without-storage.yaml  \
--stack amit-overcloud \
--control-flavor control \
--compute-flavor compute \
--ntp-server 192.168.10.4 \
--control-scale 1 \
--compute-scale 1 \
--libvirt-type qemu

# --dry-run \
