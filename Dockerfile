FROM ubuntu:bionic

RUN "apt-get update && apt-get -y install $DEPENDENCY_PACKAGES"
RUN "git clone https://github.com/steveno/libbalistica.git"
RUN "cd libbalistica && mkdir build && meson . build/ && cd build && ninja"
RUN "test/libbalistica-test"
