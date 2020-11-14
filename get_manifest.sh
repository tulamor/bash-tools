#!/bin/bash
json=$(curl -k 'https://auth.docker.io/token?service=registry.docker.io&scope=repository:cmssw/cc7:pull')
TOKEN=$(echo $json | sed "s/{.*\"token\":\"\([^\"]*\).*}/\1/g")
echo "token = $TOKEN"
curl https://registry.hub.docker.com/v2/cmssw/cc7/manifests/aarch64 -k -H "Authorization: Bearer $TOKEN"
