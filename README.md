#Rice-Bioe-421-521-Final-Project
##===============================

##Abstract:
We propose to streamline 3D printing via DLP by utilizing and contributing to multiple open source projects currently available. Our proposed system will utilize Raspberry Pi and requires 2 simultaneous functions: 1) play a slideshow of images in which an individual image corresponds to a 2D slice in a 3D model by using a DLP projector; 2) control a stepper motor, onto which a platform will be connected, via g-code. To play a slideshow of images, we will utilize console commands in Raspberry Pi. To achieve communication of the Raspberry Pi with the stepper motor, we will use a RAMBo board with a built-in stepper motor driver. To send commands to the stepper motor, we will use a GCodeCommunications program such as Pronterface or Pronsole. After confirming simultaneous control of the DLP projector and stepper motor, we will design scripts to automate, remotely, projection and motor control to operate multiple DLP 3D printers from an independent computer.

##Brainstorm:
We propose to streamline 3D printing via DLP by utilizing and contributing to multiple open source projects currently available. Our proposed system will utilize Raspberry Pi and requires 2 main functions: 1) play a slideshow of images in which an individual image corresponds to a 2D slice in a 3D model by using a DLP projector; 2) control a stepper motor via g-code. To play a slideshow of images, we will utilize console commands in Raspberry Pi. To achieve communication of the Raspberry Pi with the stepper motor, we will use EasyDriver Stepper Motor Driver. To send commands to the stepper motor, we will use a GCodeCommunications program. After confirming integrated control over the DLP projector and stepper motor, we will design scripts for controlling the DLP projector remotely.

##Digital Light Projection Photolithography Printing (DLP)
*Bagrat will write -- add paragraph from GRC poster*

###RAMBo
*description of RAMBo and how we use it*

###Marlin Firmware
*description*

##Printrun - usage
Printrun is a collection of three useful gcode interpreters. A detailed description of the functionality of Printrun can be found in the README.md file in the "USING PRINTRUN" section. 

*description of how we use Printrun goes here*


##Dependencies/Install Instructions:
###Printrun
Printrun is available on github. User is kliment and the repository is named "Printrun".

```
$ git clone https://github.com/kliment/Printrun
```

Check the README.md file in the main directory of Printrun to find the original installation instructions.  There are quite a few dependencies, but the following code should work for a Raspberry Pi B+.

```
$ sudo apt-get install python-serial python-wxgtk2.8 python-pyglet python-tornado python-setuptools python-libxml2 python-gobject avahi-daemon libavahi-compat-libdnssd1 python-dbus python-psutil git
```

## SSHing
http://www.raspberrypi.org/documentation/remote-access/vnc/README.md

## Extra features
### Optimization
* Timing
* Error handling


### Take pictures during print
Using RaspiCam, images of the printing process can be taken for checking print fidelity and making movies of the printing process. The RaspiCam documentation is available in github. A raspistill command will be implemented in the master script (in the initBackground definition) to take a photo and save it with the date and time in the filename in a specific destination (*would be cool to send each img via email during printing* :

```
DATE=$(date +"%Y-%m-%d_%H%M")
filename = "filename$DATA"

raspistill -o /home/pi/camera/filename.jpg

```

### Send log and images to gmail
To send a gmail of the print log and images taken during printing, ``` ssmpt `` will need to be installed and a gmail account will need to be configured as a smarthost.

http://www.raspberrypi.org/forums/viewtopic.php?f=36&t=32077
http://harizanov.com/2013/07/raspberry-pi-emalsms-doorbell-notifier-picture-of-the-person-ringing-it/

### Deposit material
Enable X or Y motor

### Capacitive sensing for Z0
