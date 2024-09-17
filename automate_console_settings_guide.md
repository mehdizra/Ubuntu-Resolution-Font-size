1. Download the src folder that contain these files: `customize_resolution.txt` & `resolution_script`
2. Do level 1 to 5 in [manual_console_settings_guide](https://github.com/mehdizra/Ubuntu-Resolution-Font-size/blob/master/manual_console_settings_guide.md) to find out available resolutions.
3. Choose and remember the appropriate screen resolution. 
4. After rebooting the system write your chosen resolution number in `customize_resolution.txt` file:
	note: It should contain two numbers and an x ​​as separator without space. And first number should be more than second one.
for example:
```bash
echo 1024x768 > customize_resolution.txt
```
5. run the script with sudo permition
```bash
sudo bash resolution-script.sh
```
