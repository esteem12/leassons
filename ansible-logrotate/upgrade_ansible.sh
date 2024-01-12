#!/bin/bash

# Author: ADAM M - WEZVA TECHNOLOGIES
# This script updates the current version of Ansible to a latest version available

if [[ `id -u` -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# Get current version of ansible #
cv=`ansible --version | head -1 | awk '{print substr($NF, 1, length($1)-1)}'`

echo "Upgrading current version of ansible from $cv to latest version ..."
echo "Step 1: Remove existing version ..."
apt remove ansible -y

echo "Step 2: Remove everything related to Ansible ..."
apt --purge autoremove -y

echo "Step 3: Install common libraries ..."
apt install software-properties-common -y

echo "Step 4: Add PPA repository ..."
apt-add-repository ppa:ansible/ansible -y

echo "Step 5: Update the packages ..."
apt update

echo "Step 6: Install latest version of Ansible ..."
apt install ansible -y
