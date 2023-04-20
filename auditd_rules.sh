#!/bin/bash

function add_auditd_rules()
{
    echo "- Enhancing auditd rules"
    local CONF="/etc/audit/rules.d/audit.rules"

    if [ ! -f "$CONF" ]
    then
        echo "- Auditd rules file not found. Creating it now..."
        touch "$CONF"
    fi

    # Set the auditd rules file for auditing of enforcement actions
    # Enable auditing of enforcement actions related to access restrictions
    if [ -s "$CONF" ]
    then
        sed -i -e '$a## Enable auditing of enforcement actions related to access restrictions' $CONF
    else
        echo '## Enable auditing of enforcement actions related to access restrictions' > $CONF
    fi

    # x32 arch
    sed -i -e '$a## x32 arch' $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S chmod -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'        $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S chown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'        $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S fchmod -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'       $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S fchmodat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'     $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S fchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'       $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S fchownat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'     $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S fremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S fsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'    $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S lchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'       $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S lremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S lsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'    $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S removexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'  $CONF
    sed -i -e '$a-a always,exit -F arch=b32 -S setxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'     $CONF

    # x64 arch
    sed -i -e '$a## x64 arch' $CONF
    
    sed -i -e '$a-a always,exit -F arch=b64 -S chmod  -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'       $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S chown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'        $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S fchmod -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'       $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S fchmodat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'     $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S fchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'       $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S fchownat -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'     $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S fremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S fsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'    $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S lchown -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'       $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S lremovexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod' $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S lsetxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'    $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S removexattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'  $CONF
    sed -i -e '$a-a always,exit -F arch=b64 -S setxattr -F auid>=1000 -F auid!=-1 -F auid!=4294967295 -k perm_mod'     $CONF

    # Enable auditing of system changes
    sed -i -e '$a## Enable auditing of system changes'   $CONF
    sed -i -e '$a-w /etc/passwd -p wa -k audit_passwd'   $CONF
    sed -i -e '$a-w /etc/group -p wa -k audit_group'     $CONF
    sed -i -e '$a-w /etc/shadow -p wa -k audit_shadow'   $CONF
    sed -i -e '$a-w /etc/gshadow -p wa -k audit_gshadow' $CONF

    # Enable auditing of unauthorised changes
    sed -i -e '$a## Enable auditing of unauthorised changes'           $CONF
    sed -i -e '$a-w /etc/ -p wa -k system-files-changes'               $CONF
    sed -i -e '$a-w /etc/sudoers -p rwa -k priv_esc'                   $CONF
    sed -i -e '$a-w /etc/sudoers.d/ -p rwa -k priv_esc'                $CONF
    sed -i -e '$a-w /etc/selinux/ -p wa -k selinux-policy-changes'     $CONF
    sed -i -e '$a-w /etc/sysconfig/iptables -p wa -k iptables-changes' $CONF
    sed -i -e '$a-w /etc/ssh/sshd_config -p wa -k ssh-config-changes'  $CONF

    # Enable auditing of potential privilege escalation
    sed -i -e '$a## Enable auditing of potential privilege escalation' $CONF
    sed -i -e '$a-w /bin/su -p x -k priv_esc'                          $CONF
    sed -i -e '$a-w /usr/bin/sudo -p x -k priv_esc'                    $CONF

    echo "- Auditing rules enabled..."

    # Restart auditd service
    echo "- Restarting auditd service to apply new rules..."
    if command -v systemctl &> /dev/null
    then
        systemctl daemon-reload
    else
        #/etc/init.d/auditd restart &> /dev/null
        service auditd restart &> /dev/null
    fi


}
