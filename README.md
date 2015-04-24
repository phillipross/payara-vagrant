# README #

Vagrantfile for Payara.

Currently it uses ubuntu/trusty64 as a base and gets the Java EE Full profile of Payara 4.1.151, extracting to /opt/payara. OpenJDK 7 is installed, since that is the latest Java currently available in the Ubuntu repos.

### TODO ###

* Install Payara as a service
* Make Payara start on vagrant up
* Configure Payara for remote admin (enable-secure-admin etc)