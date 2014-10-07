#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        ssh-keygen -t dsa -f /root/.ssh/id_dsa -N ""
        echo 'already configured'
else
      #code that need to run only one time ....
        
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
