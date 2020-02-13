#!/bin/bash
#
# build.sh
#
# This script:
# (1) forms a template file for the SDKPerf nodes
# (2) forms a template file for the Solace broker nodes
# (3) builds using terraform
# (4) generates inventory lists for use by ansible
#
# @author Andrew Roberts
# - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + -

cd `dirname $0`

function msg() {
  line="- + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + - + "
  echo ""; echo "$line"; echo "$*"; echo "$line"; echo ""
}

if [ "$#" -ne 2 ]; then
	echo "  USAGE: $0 <SDKPERF_NODE_COUNT> <BROKER_NODE_COUNT>"
	echo ""
	exit 0
fi
SDKPERF_NODE_COUNT=$1
BROKER_NODE_COUNT=$2

cd terraform

msg "Creating a terraform file for the SDKPerf nodes"
cat templates/sdkperf-nodes.template \
| sed -e "s/__NODE_COUNT__/$SDKPERF_NODE_COUNT/g" \
> sdkperf-nodes.tf
echo "Created sdkperf-nodes.tf"

msg "Creating a terraform file for the Solace PubSub+ event broker nodes"
cat templates/solace-broker-nodes.template \
| sed -e "s/__NODE_COUNT__/$BROKER_NODE_COUNT/g" \
> solace-broker-nodes.tf
echo "Created solace-broker-nodes.tf"

# build cloud resources from generated terraform files
terraform init
terraform apply

# form inventory files
python3 generate-ansible-inventory.py
cd ..
