#!/bin/bash 

AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
HDPCLUSTERNAME=$HDPCLUSTERNAME
PEMKEY=$PEMKEY
EDGENODETYPE="m3.xlarge"
MASTERNODETYPE="m3.xlarge"
SLAVENODETYPE="m3.xlarge"
NUMNODES=3
EBSVOLSIZE=50
ANSIBLE_HOST_KEY_CHECKING=False

# Here we provision all nodes
ansible-playbook -v  ./ansible/provision_env.yml
# configure common
ansible-playbook -v -i ~/.ansible/local_inventory/all_instances  ./ansible/configure-instances.yml
# configure edge node
ansible-playbook -v -i ~/.ansible/local_inventory/edgenode_instance  ./ansible/configure-edge-node.yml
