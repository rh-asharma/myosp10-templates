openstack overcloud deploy --templates -e /home/stack/myosp10-templates/ospd-8-9-10-multiple-nic-vlan/old-network-environment.yaml -e  /usr//share/openstack-tripleo-heat-templates/environments/storage-environment.yaml --control-scale 1  --compute-scale 1 --ceph-storage-scale 1 --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage --libvirt-type qemu  --neutron-network-type vxlan --neutron-tunnel-types vxlan



openstack overcloud update --templates -e /home/stack/myosp10-templates/ospd-8-9-10-multiple-nic-vlan/old-network-environment.yaml -e  /usr//share/openstack-tripleo-heat-templates/environments/storage-environment.yaml -e /home/stack/myosp10-templates/ospd-8-9-10-multiple-nic-vlan/amit-custom/amit-custom-script.yaml   --control-scale 1  --compute-scale 1 --ceph-storage-scale 1 --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage --libvirt-type qemu  --neutron-network-type vxlan --neutron-tunnel-types vxlan
