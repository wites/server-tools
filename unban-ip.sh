#!/bin/bash
# unban-ip.sh - Manually unban one or more IP addresses in a Fail2Ban jail
#
# Default jail: apache-badbots
# Usage: sudo unban-ip.sh <IP_ADDRESS_1> [IP_ADDRESS_2 ...]
#
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <IP_ADDRESS_1> [IP_ADDRESS_2 ...]"
  exit 1
fi

JAIL="apache-badbots"  # change to your jail name if different
IP_REGEX='^([0-9]{1,3}\.){3}[0-9]{1,3}$'

for IP in "$@"; do
  if [[ $IP =~ $IP_REGEX ]]; then
    echo "Unbanning $IP from jail $JAIL..."
    fail2ban-client set "$JAIL" unbanip "$IP"
  else
    echo "Skipping invalid IP: $IP"
  fi
done

echo "Done."
