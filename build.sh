# /bin/env sh

./boot2docker init
./boot2docker up
cat centos-docker.tar | ./docker import - tmp/centos
./docker build --rm -t vnc docker-desktop
./docker run -h vnctest -d -p 5901:5901 -p 0.0.0.0::22 vnc
