#!/bin/sh
### In tor.sh (make sure this file is chmod +x):
# `/sbin/setuser xxxxx` runs the given command as the user `xxxxx`.
# If you omit that part, the command will be run as root.

exec /usr/sbin/sshd -D >>/var/log/tor.log 2>&1
