# Terraform GCP Project

This project uses Terraform to provision and manage resources on Google Cloud Platform (GCP). It is designed with a modular structure to enhance organization, reusability, and scalability.

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Modules](#modules)
  - [Instances Module](#instances-module)
  - [Storage Module](#storage-module)
  - [VPC Module](#vpc-module)
- [Resources Created](#resources-created)
- [Prerequisites](#prerequisites)
- [Setup and Usage](#setup-and-usage)
- [Variables](#variables)
- [Outputs](#outputs)

## Overview

This repository contains Terraform configurations to set up a basic GCP environment, including virtual machines, storage buckets, and networking resources. The modular design separates concerns, making it easier to maintain and extend.

## Project Structure

The project is organized as follows:

```
terraform_gcp/
├── main.tf                 # Entry point for Terraform configuration
├── variables.tf            # Global variables for the project
├── outputs.tf              # Global outputs for the project
├── terraform.tfvars        # Default variable values (optional)
└── modules/
    ├── instances/          # Module for Compute Engine VM instances
    │   ├── instances.tf    # VM instance definitions
    │   ├── variables.tf    # Module-specific variables
    │   └── outputs.tf      # Module-specific outputs
    ├── storage/            # Module for Cloud Storage buckets
    │   ├── storage.tf      # Bucket definitions
        ├── variables.tf    # Module-specific variables
        └── outputs.tf      # Module-specific outputs
    └── vpc/                # Module for VPC and networking
        ├── vpc.tf          # VPC and subnet definitions
        ├── variables.tf    # Module-specific variables
        └── outputs.tf      # Module-specific outputs
```

## Modules

### Instances Module

- **Purpose**: Provisions two Google Compute Engine VM instances (`tf-instance-1` and `tf-instance-2`).
- **Details**: Uses Debian 11 images by default.

### Storage Module

- **Purpose**: Creates a Google Cloud Storage bucket.
- **Details**: Configured with uniform bucket-level access for consistent permissions.

### VPC Module

- **Purpose**: Sets up a Virtual Private Cloud (VPC) network.
- **Details**: Uses the [terraform-google-modules/network/google](https://registry.terraform.io/modules/terraform-google-modules/network/google/latest) module to create a VPC with two subnets.

## Resources Created

This project provisions the following GCP resources:

- **2 VM Instances**: Running Debian 11, hosted in the specified zone.
- **1 Storage Bucket**: A secure Google Cloud Storage bucket with uniform access control.
- **1 VPC Network**: A custom VPC with two subnets for network isolation.
- **1 Firewall Rule**: Allows TCP traffic on port 80 (HTTP).


