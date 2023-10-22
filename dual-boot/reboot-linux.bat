:: Mount linux partition (the disk number can be found in the Paragon tool ui)
@echo off
"C:\Program Files (x86)\Paragon Software\LinuxFS for Windows\extmounter" /mount disk2 L:

:CheckForFile
IF EXIST "L:\boot\grub\grubenv" GOTO FoundIt
GOTO CheckForFile
:FoundIt

:: Modify next_entry and save_entry in grubenv
C:\tools\cygwin\bin\bash.exe --login -c "sed -i -e '/next_entry/c\next_entry=0' /cygdrive/l/boot/grub/grubenv;sed -i -e '/saved_entry/c\saved_entry=gnulinux-simple-835ca352-d874-44ea-afd3-69f01e109cf7' /cygdrive/l/boot/grub/grubenv"

:: Unmount and reboot
"C:\Program Files (x86)\Paragon Software\LinuxFS for Windows\extmounter" /umount disk2 L:
shutdown -r -t 00