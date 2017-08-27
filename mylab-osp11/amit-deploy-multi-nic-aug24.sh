#!/bin/bash -x



if [ "$#" -lt 1 ]; then
  echo "Pass: $0 deploy --> deploy RHOSP"
  echo "Pass: $0 update --> update RHOSP"
  exit 1
fi

test "$(whoami)" != 'stack' && (echo "This must be run by the stack user on the undercloud"; exit 1)

function deployRHOSP {

time openstack overcloud deploy --templates -e /home/stack/myosp10-templates/mylab-osp11/amit-multi-nic-network-environment.yaml \
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
}

function updateRHOSP {
time yes "" | openstack overcloud update stack amit-overcloud -i --templates \
  -e /home/stack/myosp10-templates/mylab-osp11/amit-multi-nic-network-environment.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/storage-environment.yaml
}

if [ $1 = "deploy" ]; then
  deployRHOSP
elif  [ $1 = "update" ]; then
  updateRHOSP
fi

exit 0
