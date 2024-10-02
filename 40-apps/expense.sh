#!/bin/bash

dnf install ansible -y   #user_data is root by default#
cd /tmp
git clone https://github.com/Mohansai7-ctrl/expense-using-ansible-roles.git

cd expense-using-ansible-roles

ansible-playbook -i inventory.ini mysql.yaml
ansible-playbook -i inventory.ini backend.yaml
ansible-playbook -i inventory.ini frontend.yaml

