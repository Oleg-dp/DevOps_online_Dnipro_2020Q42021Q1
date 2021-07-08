// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "compute1" {
  name         = "gcp01-jenkins"
  machine_type = "e2-medium"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7-v20210701"
    }
  }

  // Make sure flask is installed on all new instances for later steps
  //  metadata_startup_script = "sudo yum -y update; sudo yum install -y python3-pip; sudo pip3 install ansible"

  metadata_startup_script = "sudo setenforce 0; echo metadata1"

  metadata = {
    ssh-keys = "sneogcp01:${file("./gcpkey01.pem.pub")}"
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
      nat_ip = "111.111.111.111"
    }
  }

}


resource "google_compute_instance" "compute2" {
  name         = "finalip02-deploy"
  machine_type = "e2-medium"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7-v20210701"
    }
  }

  // Make sure flask is installed on all new instances for later steps
  //  metadata_startup_script = "sudo yum -y update; sudo yum install -y python3-pip; sudo pip3 install ansible"

  metadata_startup_script = "sudo setenforce 0; echo metadata1"

  metadata = {
    ssh-keys = "sneogcp01:${file("./gcpkey01.pem.pub")}"
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
      nat_ip = "111.111.111.111"
    }
  }

}



resource "google_compute_firewall" "default" {
  name    = "gcp01-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "444"]
  }

  #  provisioner "remote-exec" {
  #    inline = ["sudo yum -y update"]
  #
  #    connection {
  #      host        = "34.82.51.216"
  #      type        = "ssh"
  #      user        = "sneogcp01"
  #      private_key = file("./gcpkey01.pem")
  #    }
  # }

  #  provisioner "local-exec" {
  #    #    when    = create
  #    #    command = "sh ./ansibl.sh"
  #    command = "/usr/local/bin/ansible-playbook ./deploy_dcp01.yml"
  #  }

}
