#!/bin/bash
echo Create User ...
ansible all -m user -a "name=automation state=present" -u root --ask-pass

echo Copy SSH key ...
ansible all -m authorized_key -a "user=automation state=present key=\"{{ lookup(\'file\', \'/home/automation/.ssh/id_rsa.pub\') }}\"" -u root --ask-pass

echo Configure sudo ...
ansible all -m copy -a "content='automation ALL=(ALL:ALL) NOPASSWD: ALL' dest=/etc/sudoers.d/sudousers mode=0440" -u root --ask-pass