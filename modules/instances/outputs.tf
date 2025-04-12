output "instance_1_id" {
  description = "The ID of instance 1"
  value       = google_compute_instance.tf-instance-1.id
}

output "instance_2_id" {
  description = "The ID of instance 2"
  value       = google_compute_instance.tf-instance-2.id
}

output "instance_1_name" {
  description = "The name of instance 1"
  value       = google_compute_instance.tf-instance-1.name
}

output "instance_2_name" {
  description = "The name of instance 2"
  value       = google_compute_instance.tf-instance-2.name
}