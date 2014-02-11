#!/bin/bash

# Create the directory needed to run the sshd daemon
mkdir -p /var/run/sshd

# Add docker user and generate a random password with 12 characters that includes at least one capital letter and number.
DOCKER_PASSWORD='centos' # `pwgen -c -n -1 12`
echo User: docker Password: $DOCKER_PASSWORD
DOCKER_ENCRYPYTED_PASSWORD=`perl -e 'print crypt('"$DOCKER_PASSWORD"', "aa"),"\n"'`
useradd -m -d /home/docker -p $DOCKER_ENCRYPYTED_PASSWORD docker
sed -Ei 's/adm:x:4:/docker:x:4:docker/' /etc/group
# adduser docker sudo
echo "docker ALL=(ALL) ALL" >> /etc/sudoers

# Set the default shell as bash for docker user.
chsh -s /bin/bash docker

# Start the ssh service
service sshd start
service sshd stop
/usr/sbin/sshd -D
