# Nintendo Switch Capture Script

This is a Bash script that plays the video capture device of a Nintendo Switch using mpv, while routing the audio through the computer's speakers using PulseAudio loopback module.

## Requirements

- Bash
- PulseAudio
- mpv
- v4l2-ctl

## Usage

1. Connect the Nintendo Switch to the computer's video capture device.
2. Run the script with the following command: `./nintendoswitch-capture.sh`
3. The script will find the device file name for the capture device and play it using mpv.
4. Press `Ctrl + C` to stop the script and exit.

## Notes

- The script uses the `pactl` command to load and unload the PulseAudio loopback module. If you encounter permission issues, try running the script with `sudo`.
- The script will only work with a capture device that has MJPG format. If your device has a different format, you will need to modify the script accordingly.
- This script was tested on Ubuntu 20.04. It may work on other Linux distributions as well, but it has not been tested.

## License

This script is released under the MIT License. See the [LICENSE](LICENSE) file for details.