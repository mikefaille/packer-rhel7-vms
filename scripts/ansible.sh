#!/usr/bin/env bash

#!/bin/bash -eux
# Add the EPEL repository, and install Ansible.
# rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
yum upgrade -y
yum -y install ansible python-setuptools
