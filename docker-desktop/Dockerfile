# This file creates a container that runs X11 and SSH services
#

FROM tmp/centos
MAINTAINER Martin Wang "wangxuesong@gmail.com"

RUN yum -y update

RUN yum -y install openssh-server sudo perl

RUN yum -y groupinstall 'X Window System' 'Desktop' fonts

RUN yum -y install tigervnc-server

RUN yum clean all

# Set locale (fix the locale warnings)
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

# Copy the files into the container
ADD . /src

# Start ssh services.
CMD ["/bin/bash", "/src/startup.sh"]
