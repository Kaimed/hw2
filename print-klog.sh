#!/bin/bash
#this line tells the system where to find the correct interpereter, here the bash interp

clear
#clears the console screen

sudo dmesg -c > /dev/null
#sudo gives us increased priveleges, allowing dmesg to run as root;
#dmesg -c prints the contents of the ring buffer then clears it;
# > /dev/null takes the output of dmesg -c and redirects it into /dev/null
# /dev/null is a file which deletes all data written to it after reporting a successful write

sudo insmod simple.ko
#insmod inserts the simple.c program into the kernel as a module.

echo 'Going to sleep...'
#prints 'going to sleep..' to the console

sleep 3 && echo 'Woke up!' &
#this causes the machine to sleep for 3 seconds then print 'Woke up' to the screen. 
#The single & tells this to run in the background
#the double && tells these to run sleep 3 then echo 'Woke up!'

echo -n 'waiting for sleeping process..'
#the -n flag for echo removed the trailing \n from the print

wait
#this waits for the commands above running in the background to finish

echo 'Back to work'
#prints back to work

sudo rmmod simple
#removes the simple.c module form the kernel

dmesg
#prints the message buffer of the kernel

echo "Done"
#prints Done

exit 0
#exits the script with code 0 (no error)
