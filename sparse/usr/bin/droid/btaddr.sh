#!/bin/bash

mkdir -p "/var/lib/bluetooth"
chmod 0755 "/var/lib/bluetooth"
addr="$(cat /efs/bluetooth/bt_addr)"
if [ -e "/var/lib/bluetooth/board-address" ]; then
	if [ "$addr" != "$(cat /var/lib/bluetooth/board-address)" ]; then
		echo "macaddr: Updating bt MAC address"
		echo "$addr" > /var/lib/bluetooth/board-address
		echo "macaddr: Done"
	fi
else
	echo "macaddr: Setting bt MAC address"
	echo "$addr" > /var/lib/bluetooth/board-address
	echo "macaddr: Done"
fi
