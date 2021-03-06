#!/usr/bin/env bash

# set ulimits
echo \
"* soft nofile 131072
* hard nofile 131072
root soft nofile 131072
root hard nofile 131072" | tee -a /etc/security/limits.conf
echo "session    required    pam_limits.so" | tee -a /etc/pam.d/common-session
echo "session    required    pam_limits.so" | tee -a /etc/pam.d/common-session-noninteractive

# make sysctl changes
echo \
"vm.swappiness=0
net.ipv4.tcp_max_syn_backlog = 40000
net.core.somaxconn = 40000
net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.ipv4.tcp_sack = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_keepalive_intvl = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_moderate_rcvbuf = 1
net.core.rmem_max = 134217728
net.core.wmem_max = 134217728
net.ipv4.tcp_mem  = 134217728 134217728 134217728
net.ipv4.tcp_rmem = 4096 277750 134217728
net.ipv4.tcp_wmem = 4096 277750 134217728
net.core.netdev_max_backlog = 300000" | tee -a /etc/sysctl.conf
sysctl -p