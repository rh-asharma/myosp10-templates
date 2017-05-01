

openstack overcloud deploy --templates -r /home/stack/myosp10-templates/mylab-osp1/amit-custom-roles.yaml -e /home/stack/myosp10-templates/mylab-osp10/amit-lab-config.yaml  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml --control-scale 1  --compute-scale 1 --control-flavor control --compute-flavor compute --libvirt-type qemu  --neutron-network-type vxlan --neutron-tunnel-types vxlan
