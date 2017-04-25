#!/bin/bash -x

# -------------------------------------------------------
# SAFETY CHECKS

if [ "$#" -lt 1 ]; then
  echo "Pass: $0 deploy --> Deploy RHOSP"
  echo "Pass: $0 update --> Update RHOSP packages"
  exit 1
fi


test "$(whoami)" != 'stack' && (echo "This must be run by the stack user on the undercloud"; exit 1)

function deployRHOSP {
openstack overcloud deploy --templates  \
-e ~/myosp10-templates/ospd-8-9-10-multiple-nic-vlan/old-network-environment.yaml \
-e  /usr//share/openstack-tripleo-heat-templates/environments/storage-environment.yaml \
-e ~/myosp10-templates/ospd-8-9-10-multiple-nic-vlan/amit-custom/amit-custom-script.yaml \
-t 120 \
  --control-scale 1 \
  --compute-scale 1 \
  --ceph-storage-scale 1 \
  --compute-flavor compute \
  --control-flavor control \
  --ceph-storage-flavor ceph-storage \
  --libvirt-type qemu \
  --ntp-server pool.ntp.org \
  --neutron-network-type vxlan \
  --neutron-tunnel-types vxlan \
}

echo "2" 

function updateRHOSP {
time yes "" | openstack overcloud update stack overcloud -i --templates \
 -e ~/myosp10-templates/ospd-8-9-10-multiple-nic-vlan/old-network-environment.yaml \
 -e  /usr//share/openstack-tripleo-heat-templates/environments/storage-environment.yaml \
 -e ~/myosp10-templates/ospd-8-9-10-multiple-nic-vlan/amit-custom/amit-custom-script.yaml \
}

echo "3"

if [ $1 = "deploy" ]; then
    echo "deploy"
    deployRHOSP
fi


echo "4"

if [ $1 = "update" ]; then
    updateRHOSP
fi

exit 0
