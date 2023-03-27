#!/bin/bash

# Find the device file name for the capture device
DEVICE_AUDIO=$(pactl list short sources | grep -i alsa_input.usb-USB3.0_HD_Audio_Capture_USB3.0_HD_Video_Capture | awk '{print $2}' | sed 's/\.monitor//')

# Unload the loopback module
pactl unload-module module-loopback

# Load the loopback module with the device file name and sink name
pactl load-module module-loopback source="$DEVICE_AUDIO" sink=nintendoswitch

# Play the video capture device using mpv
DEV_VIDEO=""

# Find the device file name for the capture device with only MJPG format
for device in /dev/video*
do   
    formats=$(v4l2-ctl -d "$device" --list-formats | sed -n "s/.*'\(.*\)' (.*/\1/p")
    format_count=$(echo "$formats" | wc -l)
    
    if [[ "$format_count" -eq 1 ]] && [[ "$formats" == "MJPG" ]]; then
        DEV_VIDEO="$device"
    fi
done

if [[ -z "$DEV_VIDEO" ]]; then
    echo "Could not find a device with MJPG format."
else
    echo "Using device $DEV_VIDEO with MJPG format."
    mpv "$DEV_VIDEO" --osc=no --title="Nintendo Switch"
fi

# Unload the loopback module
pactl unload-module module-loopback
