docker-rpi-habridge
========

Run HABridge inside a docker container on your RaspberryPI.

https://github.com/bwssytems/ha-bridge

Based on the work from tsgoff:
https://github.com/tsgoff/docker-alexa-ha-bridge  

Use --net=host for functional UPnP discovery

Quickstart
----------

    docker run --name bridge -d --net=host michaelmiklis/rpi-habridge

Options
-------
 - PORT="-Dserver.port=8080" 
 - KEY="-Dsecurity.key=Xfawer354WertSdf321234asd" 
 - IP="-Dserver.ip=192.168.1.1" 
 - CONFIG="-Dconfig.file=/home/me/data/myhabridge.config" 
 - GARDEN="-Dexec.garden=/bridge/" 
 

Example
-------
Mount backup file and define custom port

    docker run --name bridge -d --net=host \
    -v /bridge/data/:/bridge/data \
    -e PORT="-Dserver.port=8080" \
    -e KEY="-Dsecurity.key=Xfawer354WertSdf321234asd" \
    -e IP="-Dserver.ip=192.168.1.1" \
    -e GARDEN="-Dexec.garden=/bridge/" michaelmiklis/rpi-habridge
