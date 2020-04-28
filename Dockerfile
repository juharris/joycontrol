# docker build -t joycontrol .
# docker run --rm --volume ${PWD}:/home/workspace/joycontrol --net=host --privileged -i -t joycontrol /bin/bash

# https://stackoverflow.com/a/47525856
# docker run --rm --volume ${PWD}:/home/workspace/joycontrol --net=host --cap-add=SYS_ADMIN --cap-add=NET_ADMIN -it joycontrol /bin/bash
FROM ubuntu:18.04

RUN apt update

# RUN apt-get install libdbus-1-dev libdbus-glib-1-dev
RUN apt install --yes bluez git libdbus-1-dev libdbus-glib-1-dev libhidapi-hidraw0 python3-dbus python3-pip

COPY setup.py /home/workspace/joycontrol/
WORKDIR /home/workspace/joycontrol/
RUN pip3 install .

# lsmod | grep bluetooth
# modprobe -vvv bluetooth modprobe -vvv btusb