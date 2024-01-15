#!/bin/bash

##################################################
# Author: Niklas HOOK
# Credits: David Bernhard (n.ethz.ch/~dbernhard/)
# Filename: pi-led-control.sh
# Description: Turn on/off leds on raspberry
# Usage: pi-led.control.sh <on|off>
#        (must be run as root)
##################################################

LED_POWER=/sys/class/leds/PWR/brightness
LED_ACTIVITY=/sys/class/leds/ACT/brightness

Print_Error() {
   echo "$(basename $0): $1"
}

# Check if user is root
if [ $(whoami) != "root" ]
then
   Print_Error "Needs to be run as root."
   exit 1
fi

# Check that the led files exist
if [ ! -f "${LED_POWER}" ]
then
   Print_Error "Missing POWER led file (${LED_POWER})"
   exit 2
fi

if [ ! -f "${LED_ACTIVITY}" ]
then
   Print_Error "Missing ACTIVITY led brightness file (${LED_ACTIVITY})"
   exit 2
fi

# Check argument is provided
if [ $# -ne 1 ]
then
   Print_Error "One (and only one) argument is required: on|off"
   exit 3 
fi

# Check good argument
case $1 in
   "off")
      VALUE="0"
      ;;
   "on")
      VALUE="1"
      ;;
   *)
      Print_Error "Invalid argument $1"
      exit 4
      ;;
esac

# All ok, set the leds brightness
echo ${VALUE} | tee ${LED_POWER} > /dev/null && echo ${VALUE} | tee ${LED_ACTIVITY} > /dev/null

exit 0
