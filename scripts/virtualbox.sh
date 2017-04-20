#!/bin/bash -eux

#!/usr/bin/env bash
set -x

VBOX_ISO=/home/vagrant/VBoxGuestAdditions.iso
VBOX_MNTDIR=$(mktemp --tmpdir=/tmp -q -d -t vbox_mnt_XXXXXX)

# Install tools
mount -o loop $VBOX_ISO $VBOX_MNTDIR
yes|sh $VBOX_MNTDIR/VBoxLinuxAdditions.run

systemctl start  vboxadd.service
systemctl enable  vboxadd.service


# Clean up
umount $VBOX_MNTDIR
rm -rf $VBOX_MNTDIR
rm -f $VBOX_ISO
# SSH_USER=${SSH_USERNAME:-vagrant}
# SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}


# echo "==> Installing VirtualBox guest additions"
# # Assume that we've installed all the prerequisites:
# # kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
# # from the install media via ks.cfg

# mount -o loop $SSH_USER_HOME/VBoxGuestAdditions.iso /mnt
# sh /mnt/VBoxLinuxAdditions.run --nox11
# umount /mnt
# rm -rf $SSH_USER_HOME/VBoxGuestAdditions.iso
# rm -f $SSH_USER_HOME/.vbox_version

# echo "==> Removing packages needed for building guest tools"
# yum -y remove gcc cpp libmpc mpfr kernel-devel kernel-headers # keep : perl
