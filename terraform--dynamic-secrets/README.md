# dynamicsecrets

## ANSIBLE DEMO
 - Enable KV secret engine with path as "wezvatech"
 - Create secret path as ansibledemo and add values
 $ ansible-playbook sample.yml -e "mytoken=wezvatoken" -e "myvaultip=`hostname -i|awk '{print $1}'`"


## TERRAFORM DEMO
### Step 1: Setup Hasicorp Vault in dev mode
  $ cd vault
  $ ansible-playbook setupVault.yml

### Step 2: Enable AWS secret engine in vault to generate dynamic on-demand credentials
  $ cd credsetup
  $ ./tfworkflow.sh

### Step 3: Use the dynamic credentials to run terraform 
  $ cd demo
  $ ./tfworkflow.sh



