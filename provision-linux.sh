#!/bin/sh

# for centos7 yum updateでGPG Keysエラーが出た時
sudo curl -L https://yum.puppetlabs.com/RPM-GPG-KEY-puppet -o /tmp/RPM-GPG-KEY-puppet
sudo gpg --with-fingerprint "/tmp/RPM-GPG-KEY-puppet"
sudo cp /tmp/RPM-GPG-KEY-puppet /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs-PC1

# update
sudo yum makecache fast
sudo yum -y update

# epel
sudo yum install epel-release

# for installing Virtualbox Guest Additions
sudo yum install -y bzip2 gcc gcc-c++ make perl kernel-devel

# install some utilities
sudo yum install -y vim tcpflow

