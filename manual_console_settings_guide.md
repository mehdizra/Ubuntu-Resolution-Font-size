
![Pasted image 20240916193811](https://github.com/user-attachments/assets/51b532b3-29b3-44d2-af3d-b74697bf7431)

- Before of change the resolution, we need to understand what resolutions are available for this machine.
1. Restart the system 
2. In this page press `c` and enter to the GRUB Command Line.
	1. If you don't see this page, you should hold down the `shift` key.

![Pasted image 20240916194827](https://github.com/user-attachments/assets/b0d31c23-ceb9-4aed-9c11-5e9f0bd92392)

> [!hint] A pager is **a tool for displaying the contents of files or other output on the terminal, in a user friendly way, across several screens if needed**

3. Set the pager, and use `videoinfo` command to see the available resolutions:
```bash
pager=1
videoinfo
```
![Pasted image 20240916195748](https://github.com/user-attachments/assets/a4d32676-2531-49f3-b749-935795c6a83c)
![Pasted image 20240916195812](https://github.com/user-attachments/assets/e80262e2-8c3a-45bb-bbe9-b5ed8c2a431c)
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
![Pasted image 20240916200525](https://github.com/user-attachments/assets/f2d3da72-7558-4050-b063-d079812fe303)

And this is the file we see:
![Pasted image 20240916200611](https://github.com/user-attachments/assets/9b33e3c0-de3f-4d47-8ba6-ff35f66955b6)
8. Change the following value:
```bash
GRUB_CMDLINE_LINUX_DEFAULT="nomodeset"
```
9. Add the following key/value to the end of the file and save the file:
	- **and write the chosen resolution as value** 
```bash
GRUB_GFXPAYLOAD_LINUX=1024x768
```
![Pasted image 20240916201109](https://github.com/user-attachments/assets/f4e37704-9c85-44c9-a320-9af7e3d5c9a8)
10. Finally, update the grub file and then reboot:
```bash
sudo update-grub
init 6
```
![Pasted image 20240916201248](https://github.com/user-attachments/assets/6dbe2782-0abc-4423-86ff-68348d5d10f4)
The result (compare with the first picture):
![Pasted image 20240916201454](https://github.com/user-attachments/assets/a6c924a5-2689-4d51-b3c8-8eb3a0944c35)
### Font size
1. Going to the following address `/etc/default`
2. Take a backup of the console-setup file and enter it.
```bash
cd /etc/default/
ls
sudo cp console-setup console-setup.bkp
sudo vim console-setup
```
![Pasted image 20240916201647](https://github.com/user-attachments/assets/bed2dc35-37f5-4f21-ba47-227b05fb11ae)
3. Change the font size to multiples of 8, 12, 16 and etc. in doubles of each:
	- for example 16x32
![Pasted image 20240916201931](https://github.com/user-attachments/assets/ddcba101-46b2-4e9d-8f1f-f908ff5b3e44)
I changed the font size in this value `12x24`.
4. Save the file and reboot
Final result:
![Pasted image 20240916203146](https://github.com/user-attachments/assets/0a33aa7a-cf66-409a-ab17-f5f30dbbd4a3)
