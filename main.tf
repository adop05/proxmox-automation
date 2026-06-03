data "proxmox_virtual_environment_vms" "template" {
  node_name = "pve"

  filter {
    name   = "name"
    values = ["fedora-44-template"]
  }
}

resource "proxmox_virtual_environment_vm" "fedora_server" {
  name        = "fedora-lab-node-01"
  description = "Automated Fedora 44 Node"
  node_name   = "pve"

  clone {
    vm_id        = 9001
    datastore_id = "local-lvm"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = vm_network_bridge
    model  = "virtio"
  }

  initialization {
    ip_config {
      ipv4 {
        address = vm_ip_address
        gateway = vm_gateway
      }
    }
    user_account {
      username = "fedora"
      keys     = [var.ssh_public_key]
    }
  }
}
