

provider "google" {
  project     = "pratiksproject-357618"
  region  = "asia-south1"
  zone    = "asia-south1-a"
  credentials = var.gcp_credentials
}

resource "google_compute_network" "vpc" {
 name= "pratiksproject-357618-vpc"
 auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terra_subnet" {
  name          = "subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "asia-south1"
  network       = google_compute_network.vpc.id
    secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
  depends_on    = [google_compute_network.vpc]
}

resource "google_compute_firewall" "terra_firewall" {
  name    = "test-firewall"
  network = google_compute_network.vpc.name
  depends_on = [google_compute_subnetwork.terra_subnet]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}
/*
resource "google_compute_network" "default" {
  name = "test-network"
}
*/
resource "google_compute_instance" "vm_instance" {
  name         = "instance1"
  machine_type = "e2-medium"
  zone         = "asia-south1-a"
  depends_on   = [google_compute_firewall.terra_firewall]

  //tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image="debian-9-stretch-v20220406"
    }
  }

    network_interface {
    network = "default"

    access_config {
    }
  }

}


