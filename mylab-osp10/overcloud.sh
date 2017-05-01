

openstack overcloud deploy --templates -e /home/stack/myosp10-templates/mylab-osp1/amit-lab-config.yaml -e /home/stack/myosp10-templates/mylab-osp1/amit-custom-roles.yaml --control-scale 1  --compute-scale 1 --network-scale 1 --control-flavor control --compute-flavor compute --networker-flavor network --libvirt-type qemu  --neutron-network-type vxlan --neutron-tunnel-types vxlan
