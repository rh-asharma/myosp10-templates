#!/bin/bash

source ~/stackrc

now=$(date +%F-%T)

openstack overcloud deploy --templates -e /home/stack/myosp10-templates/mylab-osp11/amit-multi-nic-network-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/storage-environment.yaml \
--stack amit-overcloud \
--control-flavor control \
--compute-flavor compute \
--ceph-storage-flavor ceph-storage \
--ntp-server 192.168.122.1 \
--control-scale 1 \
--compute-scale 1 \
--ceph-storage-scale 1 \
--libvirt-type qemu

# --dry-run \
