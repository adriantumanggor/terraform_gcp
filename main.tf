terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }

  backend "gcs" {
    bucket  = "tf-bucket-269753"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
  source = "./modules/instances"
  
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}

module "storage" {
  source = "./modules/storage"
  
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "6.0.0"

    project_id   = var.project_id
    network_name = "tf-vpc-482030"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
        },
    ]
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "tf-vpc-482030"
  
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
}