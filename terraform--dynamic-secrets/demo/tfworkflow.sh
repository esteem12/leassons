#!/bin/bash

echo "#-- Setting Necessary Environment variables --#"
export VAULT_ADDR="http://`hostname`:8200"

export VAULT_TOKEN="wezvatoken"

echo "#-- Terraform Init --#"
terraform init

echo "#-- Terraform Plan --#"
terraform plan

echo "#-- Terraform Apply --#"
terraform apply -auto-approve
