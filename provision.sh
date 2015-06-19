#!/bin/bash

##########################################
#
# Setting properties
#

# Payara Version
PAYARA_VERSION=4.1.152

# Payara URLs
case "$PAYARA_VERSION" in 
	4.1.151)
		FULL=http://bit.ly/1CGCtI9
		WEB=http://bit.ly/1DmWTUY
		MINIMAL=http://bit.ly/163XP6f
		EMBEDDED_FULL=http://bit.ly/1zG59ls
		EMBEDDED_WEB=http://bit.ly/1KdVP87
		EMBEDDED_NUCLEUS=http://bit.ly/1ydQTKw
		MULTI_LANGUAGE_FULL=https://bit.ly/1zv1YeB
		MULTI_LANGUAGE_WEB=https://bit.ly/1wVXaZ
	;;
	4.1.152)
		FULL=http://bit.ly/1bGAaLi
		WEB=http://bit.ly/1Kxvt2C
		MINIMAL=http://bit.ly/1zue2io
		MICRO=http://bit.ly/1EUuZoj
		EMBEDDED_FULL=http://bit.ly/1JbWacf
		EMBEDDED_WEB=http://bit.ly/1GKDanG
		MULTI_LANGUAGE_FULL=http://bit.ly/1JUQByV
		MULTI_LANGUAGE_WEB=http://bit.ly/1HUIIKN
	;;
\*)
	echo "unknown version number"
esac

# Payara directory
PAYARA_HOME=/opt/payara/payara-$PAYARA_VERSION
#
#
#
##########################################


echo "Provisioning Payara-$PAYARA_VERSION to $PAYARA_HOME"

# Download and unzip to /opt/payara
echo "running update..."
sudo apt-get -qqy update                      # Update the repos 

echo "installing openjdk and unzip"
sudo apt-get -qqy install openjdk-7-jdk       # Install JDK 7 
sudo apt-get -qqy install unzip               # Install unzip 

echo "Downloading Payara $PAYARA_VERSION"
wget -q $WEB -O temp.zip > /dev/null           # Download Payara 
sudo mkdir -p $PAYARA_HOME/startup             # Make dirs for Payara 
unzip -qq temp.zip -d $PAYARA_HOME             # unzip Payara to dir 

# Copy startup script, and create service
echo "installing startup scripts"
sudo cp /vagrant/payara_service-$PAYARA_VERSION $PAYARA_HOME/startup/ 
sudo chmod +x $PAYARA_HOME/startup/payara_service-$PAYARA_VERSION
ln -s $PAYARA_HOME/startup/payara_service-$PAYARA_VERSION /etc/init.d/payara 

echo "Adding payara system startup..."
sudo update-rc.d payara defaults > /dev/null 

sudo chown -R vagrant:vagrant $PAYARA_HOME     # Make sure vagrant owns dir 

echo "starting Payara..."

case "$PAYARA_VERSION" in
	4.1.151)
		service payara start domain1
		;;
	4.1.152)
		service payara start payaradomain
		;;
	/*)
		echo "Unknown Payara version, attempting to start domain1..."
		service payara start domain1
esac
