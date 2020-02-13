# Benchmark Testing

## Overview

This repository is a collection of Terraform and Ansible configuration files that are useful for benchmark testing.

**These scripts allow you to**:

- Provision N number of SDKPerf nodes
- Provision N number of singleton Solace PS+ Software event broker nodes
- Configure SDKPerf commands
- Execute your configured SDKPerf command on all your SDKPerf nodes
- Kill the SDKPerf processes on all your SDKPerf nodes
- Cleanup all the resources used in your test

SDKPerf is a tool for validating performance, checking configuration, and exploring features associated with your Solace PubSub+ event broker. You can download it [here](https://solace.com/downloads/#other-software), or read our documentation on it [here](https://docs.solace.com/SDKPerf/SDKPerf.htm#contentBody).

**To tie Terraform and Ansible together, we do two things:**

- Run an Ansible playbook after the EC2 instance has been provisioned using Terraform's local_exec provisioner
- Generate an inventory list from our groups of AWS EC2 instances by formatting Terraform's output

Step 1 lets us use Ansible to set up our EC2 instances.  
Step 2 lets us use Ansible to execute playbooks on the EC2 instances we create with Terraform.

## Getting Started

There are two subdirectories in this repository: [terraform](/terraform) and [ansible](/ansible).  
Each of these subdirectories has their own README that describes what needs to be configured inside that directory.

**Along with these two subdirectories are two shell scripts**:

- **build.sh**: run this script to build AWS infrastructrure and generate inventory files to use in our Ansible commands
- **cleanup.sh**: run this script to tidy up your working directory, it'll delete the generated .tf files

So at this point, go to terraform/ and ansible/ and follow the instructions listed in those READMEs.  
When you're finished, you can run the tests listed below.

## Running the tests

Start the test using this command:  
`ansible-playbook -i ansible/inventory/sdkperf-nodes.inventory ansible/start-sdkperf.yml`

Stop the test using this command:  
`ansible-playbook -i ansible/inventory/sdkperf-nodes.inventory ansible/stop-sdkperf.yml`
