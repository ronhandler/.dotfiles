#!/usr/bin/bash

vboxsfPath='/usr/lib/systemd/system/vboxservice.service'
pattern='ConditionVirtualization=oracle'
sedLine='/'$pattern'/,${s///;b};$q1'
echo "Removing line \"$pattern\" setting from $vboxsfPath"
sudo sed -i.bak $sedLine $vboxsfPath
if [ $? -eq 0 ]; then
	sudo systemctl daemon-reload
	sudo systemctl start vboxservice.service
	echo "Done"
else
	echo "Removal failed. Match was not found in $vboxsfPath."
fi

