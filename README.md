#Rice-Bioe-421-521-Final-Project
##===============================

##Abstract:
We propose to streamline 3D printing via DLP by utilizing and contributing to multiple open source projects currently available. Our proposed system will utilize Raspberry Pi and requires 2 simultaneous functions: 1) play a slideshow of images in which an individual image corresponds to a 2D slice in a 3D model by using a DLP projector; 2) control a stepper motor, onto which a platform will be connected, via g-code. To play a slideshow of images, we will utilize console commands in Raspberry Pi. To achieve communication of the Raspberry Pi with the stepper motor, we will use a RAMBo board with a built-in stepper motor driver. To send commands to the stepper motor, we will use a GCodeCommunications program such as Pronterface or Pronsole. After confirming simultaneous control of the DLP projector and stepper motor, we will design scripts to automate, remotely, projection and motor control to operate multiple DLP 3D printers from an independent computer.

##Digital Light Projection Photolithography Printing (DLP)
DLP is a light projector technology that uses a Digital Micromirror Device (DMD) to direct light through a lens, producing a projected image. Our system utilizes additive manufacturing to print 3D objects by projecting a dynamic mask onto the print platform. Our system consists of a commercially available 1080p projector and a mobile Z-axis platform which are controlled by an Arduino based board from a computer. 

![DLP Schematic](http://i.imgur.com/rgtHdga.png)
```
Pan Y, Zhou C, and Chen Y. Rapid Manufacturing in Minutes: The Development of a Mask Projection Stereolithography Process for High-Speed Fabrication. ASME 2012 International Manufacturing Science and Engineering Conference. 405-414; doi:10.1115/MSEC2012-7232
```

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

## Accessing the DLP-Pi Remotely
To VPN into the Pi, LogMeIn Hamachi will need to be installed on both the Pi and the PC from which remote access will be performed. Additionally, a VNC such as [TightVNC Viewer](http://www.tightvnc.com/download.php) or an SSH client such as [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) will need to be installed on the PC.

### Install LogMeIn Hamachi and create a free account
1. [Download and Install LogMeIn Hamachi](https://secure.logmein.com/products/hamachi/).
2. Make a free account.
3. After logging in online, add a new network (keep Network Type as Mesh). Change "Join Requests" to "Accept Automatically" and create a network password. 

### On the Pi:
1. From the terminal, update and upgrade packages first:
```
sudo apt-get update && sudo apt-get upgrade
```

2.  Install lsb-core package:
```
sudo apt-get install lsb-core
```

3. Download the LogMeIn Hamachi client and install the package:
```
sudo wget https://secure.logmein.com/labs/logmein-hamachi-2.1.0.130-armel.tgz
tar -zxvf logmein-hamachi-2.1.0.130-armel.tgz
cd logmein-hamachi-2.1.0.130-armel
sudo ./install.sh
```
Note: As of 11/16/2014, v2.1.0.130 is the latest version. To get the latest version, go to the [Labs](https://secure.logmein.com/US/labs/#HamachiforLinux) portion of the LogMeIn website. 

4. Start the client and login:
```
sudo /etc/init.d/logmein-hamachi start
sudo hamachi login
hamachi attach [Email Address Used for LogMeIn Account]
hamachi set-nick [Nickname]
```

### Add the Pi to the Network
1. Refresh the LogMeIn website, you should see a request at the top. Accept the Pi.
2. Navigate to the created Network and go to the "Members" tab.
3. Add the PC and the Pi to the created Network and save.
4. On the LogMeIn Hamachi software, press the Power button. After some time, the dot next to the network will be green and the rasberry may be green or blue (this is okay). If not, right click the raspberry and go to "Details...". Go to the Settings tab and change "Traffic - block unsecured", "Authentication - Default", "Encryption - Enabled", "Compression - Enabled". Additionally, setting the "Local UDP and TCP addresses" to 443 under "System - Preferences - Settings" may be required.

### SSH or VNC into the Pi
To SSH into the Pi and controle it via terminal:

1. In LogMeIn Hamachi, right click on the Pi and "Copy Address".
2. Open "PuTTY" on the PC and paste the copied address in the "Session" box.
3. Press "Open". You may get a prompt to accept the certification.
4. You can now control the Pi through the terminal.

To VNC into the Pi and control it via the GUI:

1. In LogMeIn Hamachi, right click on the Pi and "Copy Address".
2. Open "TightVNC Viewer" on the PC and paste the copied address in the "Remote Host" box with a ":1" at the end (without quotation marks). 
3. Press "Connect" and enter in the network password.
4. You can now control the Pi through the GUI.

## Extra features
### Optimization
* Timing
* Error handling


### Take pictures during print and email progress
Using RaspiCam, images of the printing process can be taken for checking print fidelity and making movies of the printing process. The RaspiCam documentation is available in github.

#### Configuring email settings
To send an email of the print images taken during printing, `` ssmtp `` and `` mailutils `` packages will need to be installed and a gmail account will need to be configured as a smarthost:

```
sudo apt-get install ssmtp mailutils
```

Edit the ``ssmtp.conf`` by using ``sudo nano /etc/ssmtp/ssmtp.conf`` and change:

``mailhub`` to: ``mailhub=smtp.gmail.com:587``

Below hostname, add the following code and change AuthUser and AuthPass:

```
AuthUser=SENDEREMAIL@gmail.com
AuthPass=SENDERPASS
FromLineOverride=YES
mailhub=smtp.gmail.com:587
UseSTARTTLS=YES
```

To send an email from the Pi using Python, [code from http://kutuma.blogspot.com/](http://kutuma.blogspot.com/2007/08/sending-emails-via-gmail-with-python.html) was implemented into the script.

### Deposit material
Enable X or Y motor

