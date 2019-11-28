#!/bin/bash
# Install needed packages
echo "Installing needed packages"
yum update -y
yum install -y aws-cli awslogs
yum install -y git

# Install Python and pip
echo "Installing ansible packages"
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
/usr/local/bin/pip install ansible
