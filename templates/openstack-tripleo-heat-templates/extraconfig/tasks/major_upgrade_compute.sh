#!/bin/bash
#
# This delivers the compute upgrade script to be invoked as part of the tripleo
# major upgrade workflow.
#
set -eu

UPGRADE_SCRIPT=/root/tripleo_upgrade_node.sh

cat > $UPGRADE_SCRIPT << ENDOFCAT
### DO NOT MODIFY THIS FILE
### This file is automatically delivered to the compute nodes as part of the
### tripleo upgrades workflow

set -eu

# pin nova to kilo (messaging +-1) for the nova-compute service

crudini  --set /etc/nova/nova.conf upgrade_levels compute $upgrade_level_nova_compute

$(declare -f special_case_ovs_upgrade_if_needed)
special_case_ovs_upgrade_if_needed

yum -y install python-zaqarclient  # needed for os-collect-config
yum -y update

# Due to bug#1640177 we need to restart compute agent
echo "Restarting openstack ceilometer agent compute"
systemctl restart openstack-ceilometer-compute

ENDOFCAT

# ensure the permissions are OK
chmod 0755 $UPGRADE_SCRIPT

