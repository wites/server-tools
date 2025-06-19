#!/bin/bash
# ban-ip.sh - Manually ban one or more IP addresses in a Fail2Ban jail
#
# Default jail: apache-badbots
# Usage: sudo ban-ip.sh <IP_ADDRESS_1> [IP_ADDRESS_2 ...]
#
# Exit if no argument is supplied
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <IP_ADDRESS_1> [IP_ADDRESS_2 ...]"
  exit 1
fi

JAIL="apache-badbots"  # change to your jail name if different
IP_REGEX='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

for IP in "$@"; do
  if [[ $IP =~ $IP_REGEX ]]; then
    echo "Banning $IP in jail $JAIL..."
    fail2ban-client set "$JAIL" banip "$IP"
  else
    echo "Skipping invalid IP: $IP"
  fi
done

echo "Done."
