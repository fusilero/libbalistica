FROM ubuntu:bionic

ARG DEPS="git meson valac libgee-0.8 ninja-build"

RUN apt-get update
RUN apt-get -y install $DEPS
RUN git clone https://github.com/steveno/libbalistica.git
RUN cd libbalistica && mkdir build && meson . build/ && cd build && ninja
RUN libbalistica/build/test/libbalistica-test
