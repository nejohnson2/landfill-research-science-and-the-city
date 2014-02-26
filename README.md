###Science and the City Hackfest
####Landfill Research

These are a collection of sketches to be used with the Arduino GSM Shield.  They focus primarily on using the shield through serial communication instead of using the Arduino GSM library.  I found the library to be clunky and not allow me to do what I wanted to do.  

As an initial setup, simple upload the basic-gsm-serial-communication.ino sketch to your Arduino with the shield.  Once uploaded, use an application which lets you communicate over serial directly.  I prefer to use Cool Term.  Once you're connected over USB, push and hold the power button on the Arduino GSM shield until you see the status LED solid and the net LED blinking.

List of AT commands: http://arduino.cc/en/uploads/Main/Quectel_M10_AT_commands.pdf

####Notes on modifiying the Arduino SoftwareSerial Library

In working with the Arduino GSM shield, I kept finding text messages were only being halfway delivered.  Meaning I would only see have the message.  This happened with a couple of the AT Commands that I was using which return larger amounts of information.  The problem I kept encountering is that the serial buffers in both the SoftwareSerial Library and the GSM library were too small causing the messages and information to be incomplete.  I simply edited those variables in the library in order to get things to work properly.

If using the SoftwareSerial Library, modify the SoftwareSerial.h file to increase the buffer from 64 to 256.

This can be done by:

- Go to the Arduino application (Applications > Arduino) and right click. Select show package contents
- Find the file Resources > Java > libraries > SoftwareSerial > SoftwareSerial.h
- Change the line: __#define _SS_MAX_RX_BUFF 64__   to __#define _SS_MAX_RX_BUFF 256__
- Save file
