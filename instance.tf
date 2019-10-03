resource "openstack_blockstorage_volume_v2" "first-one-boot" {
  name = "first-one-boot"
  size = 13
  image_id = "600ab4f5-d8f0-470f-80a1-a561c1582fad"
  availability_zone = var.default_zone
}

resource "openstack_blockstorage_volume_v2" "first-one-data" {
  name = "first-one-data"
  size = 250
  availability_zone = var.default_zone
}

resource "openstack_compute_instance_v2" "first-one" {
  name              = "first-one"
  flavor_id         = "0ed83053-4df1-4208-882f-5e21db1aa6b0"
  key_pair          = var.default_keypair
  security_groups   = var.default_security_groups
  user_data         = file("./default_cloud-init.txt")
  availability_zone = var.default_zone 

  metadata = {
    foo = "bar"
  }

  network {
    name = var.default_network_name
  }

  block_device {
    uuid = "${openstack_blockstorage_volume_v2.first-one-boot.id}"
    source_type = "volume"
    boot_index  = 0
    destination_type = "volume"
    delete_on_termination = true
  }

  block_device {
    uuid = "${openstack_blockstorage_volume_v2.first-one-data.id}"
    source_type = "volume"
    boot_index = -1
    destination_type = "volume"
    delete_on_termination = true
  }
}

resource "openstack_networking_floatingip_v2" "fip1" {
  pool = "external-network-vlan120"
}

resource "openstack_compute_floatingip_associate_v2" "fip1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip1.address}"
  instance_id = "${openstack_compute_instance_v2.first-one.id}"
}
