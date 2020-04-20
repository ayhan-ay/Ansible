#!/bin/bash

ansible all -m shell -a 'rm -rf /etc/yum.repos.d/*.repo' -b
ansible all -m yum_repository -a "name=AppStream description=AppStream baseurl=ftp://172.23.10.10/repo/AppStream gpgcheck=no enabled=yes file=ftp_repos" -b
ansible all -m yum_repository -a "name=BaseOS description=BaseOS baseurl=ftp://172.23.10.10/repo/BaseOS gpgcheck=no enabled=yes file=ftp_repos" -b
