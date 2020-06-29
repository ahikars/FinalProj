provider "google" {

  version = "3.5.0"
  credentials = file(var.credentials)
  project = var.project
  region  = var.region
  zone    = var.zone

}

resource "google_compute_network" "vpc_network" {
  name = var.vpcname
}
#resource "google_compute_subnetwork" "subnet_network" {
#  name          = "sub"
#  region        = "us-central1"    
#  ip_cidr_range = "10.0.0.0/9" 	  
#  network       = google_compute_network.subnet_network.id
#  
#}

#resource "google_compute_network" "custom-test" {
# name                    = "terraform-network"
# auto_create_subnetworks = true
#}

resource "google_compute_instance" "vm_instance" {
  name         = var.vmname
  machine_type = "n1-standard-2"
  tags         = ["web","dev","http-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20200609"
    }
  }

metadata_startup_script = file("./install.sh")

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

resource "google_compute_firewall" "default" {
  name    = var.fwname
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80","22","9200","5601","9090","9100","3000","50000","5001","8080","5432","5858","32768","6379"]
  }

  target_tags = ["web","dev","http-server"]
}

# Module Vk8s
#module "k8s" {
#  source = "./k8s" 
#}