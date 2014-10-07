#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo "already configured"
else
      #code that need to run only one time ....
        mkdir -p /root/.ssh
        ssh-keygen -t dsa -f /root/.ssh/id_dsa -N ""
        echo "IdentityFile ~/.ssh/id_dsa" >> /etc/ssh/ssh_config
        cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
        cat /root/.ssh/id_dsa
        echo -e "Use this private key to connect to container by ssh"
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
