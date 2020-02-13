# Benchmark Testing - Terraform

## Instructions

1. **Edit variables.tf.EDIT-ME**  
   This file contains variables that will allow us to ssh into the EC2 instances we provision.  
   Additional instructions are included in the file's header.

2. **Edit templates/sdkperf-nodes.template.EDIT-ME**  
   This file contains the list of configurations that Terraform will apply to our EC2 nodes that will be running SDKPerf. You'll need to customize it using the security group and subnets specific to your AWS environment.

3. **Edit templates/solace-broker-nodes.template**  
   This file contains the list of configurations that Terraform will apply to our EC2 nodes that will be running a singleton Solace PS+ Event Broker. You'll need to customize it using the security group and subnets specific to your AWS environment.

4. **Configure Terraform to use the credentials of a sufficiently privileged IAM role**  
   You can do this a number of ways, but I recommend using environment variables as a quick, easy, and secure way of passing your keys to Terraform. Instructions [here](https://www.terraform.io/docs/providers/aws/index.html#environment-variables).
   ```
     export AWS_ACCESS_KEY_ID="anaccesskey"
     export AWS_SECRET_ACCESS_KEY="asecretkey"
   ```
