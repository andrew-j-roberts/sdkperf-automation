output "sdkperf-node-ips" {
  value = ["${aws_instance.sdkperf-nodes.*.public_ip}"]
}

output "solace-broker-node-ips" {
  value = ["${aws_instance.solace-broker-nodes.*.public_ip}"]
}
