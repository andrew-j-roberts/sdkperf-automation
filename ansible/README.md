# Benchmark Testing - Ansible

## Overview

Using the inventory lists generated after our Terraform build step, we're able to execute commands on all the nodes we build using Terraform.

## Instructions

1. **Edit start-sdkperf.yml.EDIT-ME**  
   This file contains all the configurations that will be passed to the SDKPerf commands that are executed on our SDKPerf nodes. The file includes additional instructions as comments.

## Running the tests

Start the test using this command:  
`ansible-playbook -i inventory/sdkperf-nodes.inventory ansible/start-sdkperf.yml`

Stop the test using this command:  
`ansible-playbook -i inventory/sdkperf-nodes.inventory ansible/stop-sdkperf.yml`
