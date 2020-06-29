#!/usr/bin/env bash
if [ ! "$(/usr/bin/docker ps -q -f name=ewpe-smart-mqtt)" ]; then
	if [ "$(/usr/bin/docker ps -aq -f status=exited -f name=ewpe-smart-mqtt)" ]; then
		# cleanup
		/usr/bin/docker rm ewpe-smart-mqtt 
	fi

	/usr/bin/docker run  -it --network="host" --name ewpe-smart-mqtt ewpe-smart-mqtt
fi
