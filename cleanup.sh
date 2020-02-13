#!/bin/bash
#
# cleaup.sh
# @author Andrew Roberts
# - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + -

cd `dirname $0`
cd terraform
trash sdkperf-nodes.tf
trash solace-broker-nodes.tf
terraform destroy
cd ..
