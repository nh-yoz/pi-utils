# pi-utils
Small utilities for raspberry pi

## pi-led-control
A bash script to turn _on_ or _off_ the leds on a raspberry pi:
- Power led: red
- Activity led: orange

### Usage
```pi-led-control <on|off>```

### Scheduling using _crontab_
Open the crontab editor:
```
crontab -e
```
Add the following lines:
```
0 22 * * * /path_to_file/pi-led-control.sh off
0 7 * * *  /path_to_file/pi-led-control.sh on
```
This will turn off the leds at 10 PM and back on at 7 AM.
