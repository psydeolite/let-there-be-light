# let-there-be-light
AP Final Project Term 2

**Instructions** <br/>
1. Plug in tie, make sure lights are flashing and on. <br/>
2. Unplug all usb devices if possible. <br/>
3. Wait a few seconds, the neopixels should turn on and become bright red <br/>
4. Type into terminal: ls /dev/tty* <br/>
5. You should see a list of serial ports. Find the one which starts with /dev/cu.usbmodem. <br/>
If there's more than one, you are probably using more than one usb port. You can either try one port then the other or unplug any other device. <br/>
6. Go into Sorts, open the Processing files. <br/>
7. Under Driver on the 8th line of code there should be "myPort = new Serial(this, "/dev/cu.usbmodem1421", 9600);" <br/>
8. Replace /dev/cu.usbmodem1421 with the port on your computer. <br/>
This is necessary because we can't predict which USB port will be used to transmit data between the Arduino and the computer. <br/> Plan C is a proof of concept for the sorting, in case the tie malfunctioned. <br/>
