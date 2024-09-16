# VirtualBox Ubuntu Resolution & Font size Problem
### Resolution
Every time we start a Linux in Oracle VirtualBox, the console is very small. Of course, this is due to the growth of the graphics hardware industry.
I've been looking for a solution to this problem and it's not something I can easily find. That's why I share it here.
![[Pasted image 20240916193811.png]]
- Before of change the resolution, we need to understand what resolutions are available for this machine.
1. Restart the system 
2. In this page press `c` and enter to the GRUB Command Line.
	1. If you don't see this page, you should hold down the `shift` key.
![[Pasted image 20240916194827.png]]

> [!hint] A pager is **a tool for displaying the contents of files or other output on the terminal, in a user friendly way, across several screens if needed**

3. Set the pager, and use `videoinfo` command to see the available resolutions:
```bash
pager=1
videoinfo
```
![[Pasted image 20240916195748.png]]
![[Pasted image 20240916195812.png]]
- We see `*` sign in front of the current resolution
4. Choose and write down the resolution somewhere
5. Exit with `normal` command
```bash
normal
```

6. Going to the address: `/etc/default/` 
7. First, make a backup of the grub file and then get into it.
```bash
cd /etc/default/
ls
sudo cp grub grub.bkp
sudo vim grub
```
![[Pasted image 20240916200525.png]]
And this is the file we see:
![[Pasted image 20240916200611.png]]
8. Change the following value:
```bash
GRUB_CMDLINE_LINUX_DEFAULT="nomodeset"
```
9. Add the following key/value to the end of the file and save the file:
	- **and write the chosen resolution as value** 
```bash
GRUB_GFXPAYLOAD_LINUX=1024x768
```
![[Pasted image 20240916201109.png]]
10. Finally, update the grub file and then reboot:
```bash
sudo update-grub
init 6
```
![[Pasted image 20240916201248.png]]
The result (compare with the first picture):
![[Pasted image 20240916201454.png]]
### Font size
1. Going to the following address `/etc/default`
2. Take a backup of the console-setup file and enter it.
```bash
cd /etc/default/
ls
sudo cp console-setup console-setup.bkp
sudo vim console-setup
```
![[Pasted image 20240916201647.png]]
3. Change the font size to multiples of 8, 12, 16 and etc. in doubles of each:
	- for example 16x32
![[Pasted image 20240916201931.png]]
I changed the font size in this value `12x24`.
4. Save the file and reboot
Final result:
![[Pasted image 20240916203146.png]]