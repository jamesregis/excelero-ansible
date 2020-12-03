# excelero-ansible

### Configuration and Usage
This project assumes you have a basic knowledge of how Ansible works and have
already prepared your hosts for configuration by Ansible.

After you’ve cloned the excelero-ansible repository, selected your branch and
installed Ansible then you’ll need to create your inventory file, playbook and
configuration for your Excelero NVMesh cluster.


### Inventory

The Ansible inventory file defines the hosts in your cluster and what roles
each host plays in your Excelero cluster. The default location for an inventory
file is /etc/ansible/hosts but this file can be placed anywhere and used with
the -i flag of ansible-playbook.

```
[excelero-mgrs]
mgmt1
mgmt2
mgmt3

[excelero-nodes]
node01
node02
node03
```

### Playbook
You must have a playbook to pass to the ansible-playbook command when deploying your cluster. There is a sample playbook at the root of the excelero-ansible project called site.yml.sample. This playbook should work fine for most usages, but it does include by default every daemon group which might not be appropriate for your cluster setup. Perform the following steps to prepare your playbook:

Rename the sample playbook: mv site.yml.sample site.yml
Modify the playbook as necessary for the requirements of your cluster.
