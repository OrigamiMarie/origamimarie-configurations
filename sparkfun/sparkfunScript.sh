#!/bin/bash
set -e # fail the whole script on any error

# Get everything up to date.
apt-get update # this updates the list of available software and libraries
apt-get upgrade -y # this updates the installed software and libraries


# Add a new user that will have full permissions.
adduser admin --disabled-password --gecos Admin # add the admin
echo admin:admin | chpasswd # give admin a password (should change later)
adduser admin sudo # make admin a sudoer
usermod -a -G dialout sparkfun # allow arduino to talk to the sparkfun board


# Install Arduino IDE.
wget https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.6_Linux_64bit.AppImage # fetch the arduino program
chmod a+x arduino-ide_2.3.6_Linux_64bit.AppImage # allow everybody to run it
mv arduino-ide_2.3.6_Linux_64bit.AppImage /usr/bin/ # put arduino in a folder that everybody can run it from
ln -s /usr/bin/arduino-ide_2.3.6_Linux_64bit.AppImage /usr/bin/arduino-ide # prettier program name, easier to switch to new versions


# Give Arduino IDE an icon in the dock.
wget https://i.sstatic.net/HbDAj.png # download the app icon
chmod a+r HbDAj.png # everybody can read the image
mv HbDAj.png /usr/bin/arduino-ide-icon.png # make the icon available to everybody
cd /home/sparkfun/.local/share/applications/
wget https://github.com/OrigamiMarie/origamimarie-configurations/raw/refs/heads/master/sparkfun/arduino-ide.desktop # get the file that defines the arduino application launcher on the dock
gsettings set org.gnome.shell favorite-apps "['pop-cosmic-applications.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'arduino-ide.desktop']" # simplify the dock and add the arduino icon (run as the sparkfun user, so it edits their dock)


# Install the sample Sparkfun code.
mkdir -p /home/sparkfun/Arduino/libraries/ # make a libraries folder for the example code
cd /home/sparkfun/Arduino/libraries/
wget https://github.com/sparkfun/SIK-Guide-Code/archive/master.zip # fetch the example code
unzip master.zip # extract the example code
cd SIK-Guide-Code-master/
mkdir examples
mv SIK* examples/ # move the example folders into the folder where arduino can actually see them
wget https://github.com/OrigamiMarie/origamimarie-configurations/raw/refs/heads/master/sparkfun/library.properties # fetch the properties file that tells arduino how to read the example code
cd ~
arduino-ide


# Cut the internet
ufw default deny incoming
ufw default deny outgoing
ufw enable # takes effect on restart


# Reduce the sparkfun user's permissions
deluser sparkfun sudo # takes effect on login / next new terminal session
