# Raspberry Utils

A collections of utils informations for the PI.

## Find your PI on the network

3 importat bit to know: [Ref](https://opensource.com/article/20/6/find-raspberry-pi)
 
 1. the led is found at `/sys/class/leds/led0`
 2. the important files are trigger and brightness
 3. we can change the selection echo into the file 

 ```bash
#!/bin/bash

set -o errexit
set -o nounset

trap quit INT TERM

COUNT=0

if ! [ $(id -u) = 0 ]; then
   echo "Must be run as root."
   exit 1
fi

LED="/sys/class/leds/led0"

if [[ ! -d $LED ]]
then
  echo "Could not find an LED at ${LED}"
  echo "Perhaps try '/sys/class/leds/ACT'?"
  exit 1
fi

function quit() {
  echo mmc0 >"${LED}/trigger"
}

echo -n "Blinking Raspberry Pi's LED - press CTRL-C to quit"

echo none >"${LED}/trigger"

while true
do
  let "COUNT=COUNT+1"
  if [[ $COUNT -lt 30 ]]
  then
    echo 1 >"${LED}/brightness"
    sleep 1
    echo 0 >"${LED}/brightness"
    sleep 1
  else
    quit
    break
  fi
done
 ```
