#!/bin/bash

function add_auditd_rules() {

# Check if auditd daemon and audit rules file exist

if [ ! -f "/usr/sbin/auditd" ]; then
  echo "Auditd daemon not found. Please install it and try again."
  exit 1
fi

if [ ! -f "/etc/audit/rules.d/audit.rules" ]; then
  echo "Auditd rules file not found. Creating it now..."
  touch "/etc/audit/rules.d/audit.rules"
fi

# Set the auditd rules file for auditing of enforcement actions

# Enable auditing of enforcement actions related to access restrictions

sed -i -e '$a## Enable auditing of enforcement actions related to access restrictions' /etc/audit/ruled.d/audit.rules

# x32 arch

sed -i -e '$a## x32 arch' /etc/audit/ruled.d/audit.rules

sed -i -e '$a-a always,exit -F arch=b32 -S chmod -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S chown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S fchmod -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S fchmodat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S fchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S fchownat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S fremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S fsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S lchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S lremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S lsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S removexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b32 -S setxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules

# x64 arch

sed -i -e '$a## x64 arch' /etc/audit/ruled.d/audit.rules

sed -i -e '$a-a always,exit -F arch=b64 -S chmod  -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S chown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S fchmod -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S fchmodat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S fchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S fchownat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S fremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S fsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S lchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S lremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S lsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S removexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-a always,exit -F arch=b64 -S setxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' /etc/audit/ruled.d/audit.rules

# Enable auditing of system changes

sed -i -e '$a## Enable auditing of system changes' /etc/audit/ruled.d/audit.rules

sed -i -e '$a-w /etc/passwd -p wa -k audit_passwd' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/group -p wa -k audit_group' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/shadow -p wa -k audit_shadow' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/gshadow -p wa -k audit_gshadow' /etc/audit/ruled.d/audit.rules

# Enable auditing of unauthorised changes

sed -i -e '$a## Enable auditing of unauthorised changes' /etc/audit/ruled.d/audit.rules

sed -i -e '$a-w /etc/ -p wa -k system-files-changes' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/sudoers -p rwa -k priv_esc' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/sudoers.d/ -p rwa -k priv_esc' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/selinux/ -p wa -k selinux-policy-changes' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/sysconfig/iptables -p wa -k iptables-changes' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /etc/ssh/sshd_config -p wa -k ssh-config-changes' /etc/audit/ruled.d/audit.rules

# Enable auditing of potential privilege escalation

sed -i -e '$a## Enable auditing of potential privilege escalation' /etc/audit/ruled.d/audit.rules

sed -i -e '$a-w /bin/su -p x -k priv_esc' /etc/audit/ruled.d/audit.rules
sed -i -e '$a-w /usr/bin/sudo -p x -k priv_esc' /etc/audit/ruled.d/audit.rules

echo "Rules correctly enabled..."

# Restart auditd service

echo "Restarting auditd service to implement new rules..."
service auditd restart &> /dev/null
echo "Auditd service successfully restarted..."

}
