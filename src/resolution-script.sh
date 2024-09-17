#!/bin/bash
file="grub"
var1="GRUB_CMDLINE_LINUX_DEFAULT"
value1="nomodeset"
var2="GRUB_GFXPAYLOAD_LINUX"
value2="1024x768"
line=$(sed -n '1p' "customize_resolution.txt")
# backup from grub file
cd /etc/default/
cp grub grub.bkp

#Extract the resolution number from customize file
if [[ "$line" =~ ^([0-9]+)x([0-9]+)$ ]]; then
    num1="${BASH_REMATCH[1]}"
    num2="${BASH_REMATCH[2]}"
    if (( num1 > num2 )) && (( num2 >= 480 )) ; then
        value2="$line"
    fi
fi

#changing GRUB_CMDLINE_LINUX_DEFAULT to nomodeset
sed -i "s/^${var1}=.*$/${var1}=\"${value1}\"/" "$file"
echo "GRUB_CMDLINE_LINUX_DEFAULT changed to nomodeset Successfully"

#set the resolution and updating grub
if ! grep -q "^${var2}=" "$file"; then
	echo "${var2}=\"${value2}\"" >> "$file"
	echo "set GRUB_GFXPAYLOAD_LINUX to, $value2"
else
	sed -i "s/^${var2}=.*$/${var2}=\"${value2}\"/" "$file"
	echo "resolution changed to, $value2"
fi
update-grub
echo "Please reboot the system"
#cat grub
