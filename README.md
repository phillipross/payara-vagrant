# README #

Vagrantfile for Payara.

Currently it uses ubuntu/trusty64 as a base and gets the Java EE Web profile of Payara 4.1.152, extracting to /opt/payara/payara-$PAYARA_VERSION. OpenJDK 7 is installed, since that is the latest Java currently available in the Ubuntu repos.

There is still work to be done, but at this point, the file is usable for development/testing purposes.

### WARNING
The installation scripts will work with any Payara (simply specify `FULL` or `MICRO` etc on the `wget` line) but the configuration script to install Payara as a service will ***NOT*** work with the embedded/micro/nucleus versions. (They're just JARs...what would you expect??)

Pull requests welcome.
