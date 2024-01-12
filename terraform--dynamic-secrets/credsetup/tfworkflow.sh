#!/bin/bash

echo "#-- Setting Necessary Environment variables --#"
export VAULT_ADDR="http://`hostname`:8200"

export VAULT_TOKEN="wezvatoken"

export TF_VAR_aws_access_key=`grep aws_access_key_id ~/.aws/credentials|head -1|awk '{print $3}'`

export TF_VAR_aws_secret_key=`grep aws_secret_access_key  ~/.aws/credentials|head -1|awk '{print $3}'`

echo "#-- Terraform Init --#"
terraform init

echo "#-- Terraform Plan --#"
terraform plan

echo "#-- Terraform Apply --#"
terraform apply -auto-approve
