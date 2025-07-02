#!/bin/bash

email=$1

#create key
echo "creating key"
ssh-keygen -t rsa -b 4096 -C "$1"

eval "$(eval ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

echo "COPY THE CONTENTS BELOW TO GITHUB SSHKEY ENTRY"
echo " "
echo " "
echo " "
cp ~/.ssh/id_rsa/pub .
cat ~/.ssh/id_rsa.pub
echo " "
echo " "
echo " "
echo "ssh key generation complete"
