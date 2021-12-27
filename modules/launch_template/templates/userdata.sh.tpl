#!/bin/bash -e

# Set variables for custom AMI
API_SERVER_URL=${cluster_endpoint}
B64_CLUSTER_CA=${cluster_auth_base64}

# User supplied pre userdata
${pre_userdata}

# Call bootstrap for EKS optimised custom AMI
/etc/eks/bootstrap.sh ${cluster_name} --apiserver-endpoint $API_SERVER_URL --b64-cluster-ca $B64_CLUSTER_CA