# generate-ansible-inventory.py
#
# hacky helper script that helps me generate an ansible inventory file
# from the output of `terraform output <resource group>`
# inventory groups should correspond to output.tf
#
# please message me on GitHub if there's a built in way to do this :)
#
# @author Andrew Roberts

import os
import json

# format sdkperf node ip list
command = 'terraform output sdkperf-node-ips'
raw_list = os.popen(command).read()
list_with_whitespace = raw_list.replace(
    "[", "").replace("]", "").replace('"', "")
list_no_whitespace = "".join(list_with_whitespace.split())
csv_list = list_no_whitespace.replace(",,", "")
clean_list = csv_list.split(",")
# write to sdkperf-node.inventory
f = open("../ansible/inventory/sdkperf-nodes.inventory", "w")
f.write("[sdkperf-nodes]" + "\n")
for ip in clean_list:
    f.write(ip + "\n")
f.close()

# format solace broker node ip list
command = 'terraform output solace-broker-node-ips'
raw_list = os.popen(command).read()
list_with_whitespace = raw_list.replace(
    "[", "").replace("]", "").replace('"', "")
list_no_whitespace = "".join(list_with_whitespace.split())
csv_list = list_no_whitespace.replace(",,", "")
clean_list = csv_list.split(",")
# write to sdkperf-node.inventory
f = open("../ansible/inventory/solace-broker-nodes.inventory", "w")
f.write("[solace-broker-nodes]" + "\n")
for ip in clean_list:
    f.write(ip + "\n")
f.close()
