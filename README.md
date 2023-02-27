# auditd_baseline

Here is a bash script that contains a list of useful auditd rules that can be implemented.
The rules are added in /etc/auditd/rules.d/audit.rules using "sed", and each of them is added in a new line. The auditd service is then restarted in order to make the rules persistent.
Is assumed that auditd service is installed
