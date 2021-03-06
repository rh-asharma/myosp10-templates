jq . << EOF > ~/instackenv.json
{
  "ssh-user": "stack",
  "ssh-key": "$(cat ~/.ssh/id_rsa)",
  "power_manager": "nova.virt.baremetal.virtual_power_driver.VirtualPowerManager",
  "host-ip": "192.168.122.1",
  "arch": "x86_64",
  "nodes": [
    {
      "name": "overcloud-node1",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 1p /tmp/nodes.txt)"
      ],
      "cpu": "16",
      "memory": "16384",
      "disk": "50",
      "arch": "x86_64",
      "pm_user": "stack"
    },
    {
      "name": "overcloud-node2",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 2p /tmp/nodes.txt)"
      ],
      "cpu": "16",
      "memory": "16384",
      "disk": "50",
      "arch": "x86_64",
      "pm_user": "stack"
    },
    {
      "name": "overcloud-node3",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 3p /tmp/nodes.txt)"
      ],
      "cpu": "16",
      "memory": "16384",
      "disk": "50",
      "arch": "x86_64",
      "pm_user": "stack"
    },
    {
      "name": "overcloud-node4",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 4p /tmp/nodes.txt)"
      ],
      "cpu": "16",
      "memory": "16384",
      "disk": "50",
      "arch": "x86_64",
      "pm_user": "stack"
    },
    {
      "name": "overcloud-node5",
      "pm_addr": "192.168.122.1",
      "pm_password": "$(cat ~/.ssh/id_rsa)",
      "pm_type": "pxe_ssh",
      "mac": [
        "$(sed -n 5p /tmp/nodes.txt)"
      ],
      "cpu": "16",
      "memory": "16384",
      "disk": "50",
      "arch": "x86_64",
      "pm_user": "stack"
    }
  ]
}
EOF
