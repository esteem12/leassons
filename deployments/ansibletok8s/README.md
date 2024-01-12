# deployments

This repo contains files for doing a product deployment:

* Pre-requisites 
 - Generate a passwordless SSH between Ansible Master & Kubernetes Master
 - update kubehosts with the Kubernetes Master IP address 
 - Make sure python is installed on kubernetes master (python 3)
   - make sure /usr/bin/python refers to python3
 - Set Ansible Master as a node to Jenkins

* Create a Jenkins Job which get the following parameters from the user:
 - deployenv (default to dev)
 - dbhost (default to devdb)
 - dbuser (default to devuser)
 - deployImage (defaults to wezvacicd)
 - dockerhubuser (defaults to adamtravis)
 - dockerhubpassword

* Using the parameters create deployvars.yml which has the respective variables and corresponding values:
deployenv: dev
dbhost: devdb
dbuser: devuser
deployImage: wezvacicd
dockerhubuser: adamtravis

* Invoke the playbook
echo "== Preparing the prerequiste =="
echo "deployenv: $deployenv" >> deployvars.yml
echo "dbhost: $dbhost" >> deployvars.yml
echo "dbuser: $dbuser" >> deployvars.yml
echo "deployImage: $deployImage" >> deployvars.yml

$ ansible-playbook deploy.yml -i kubehosts --extra-vars dockerhubpassword=$dockerhubpassword

NOTE: If kubectl is not able to read the kubeconfig, then give read permission to /root/.kube/config file

