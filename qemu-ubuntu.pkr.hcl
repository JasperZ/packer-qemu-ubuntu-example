source "qemu" "ubuntu" {
  iso_url          = "https://releases.ubuntu.com/20.04/ubuntu-20.04.2-live-server-amd64.iso"
  iso_checksum     = "sha256:d1f2bf834bbe9bb43faf16f9be992a6f3935e65be0edece1dee2aa6eb1767423"
  output_directory = "artifacts"
  shutdown_command = "sudo -S shutdown -P now"
  memory           = "1024"
  disk_size        = "6G"
  format           = "qcow2"
  accelerator      = "kvm"
  http_directory   = "http"
  ssh_username     = "packer"
  ssh_password     = "packer"
  ssh_timeout      = "20m"
  vm_name          = "ubuntu-20.04.2.qcow2"
  net_device       = "virtio-net"
  disk_interface   = "virtio"
  boot_wait        = "3s"
  boot_command = [
    "<enter><wait><enter><wait><f6><wait><esc><wait><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "initrd=/casper/initrd ",
    "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ",
    "quiet ",
    "--- <enter>",
  ]
  headless = true
}

build {
  sources = [
    "source.qemu.ubuntu"
  ]

  provisioner "ansible-local" {
    playbook_file = "./ansible-playbook.yaml"
  }
}
