FROM ubuntu:18.04

RUN apt-get -y update
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g-dev:i386 libz-dev:i386
RUN apt-get update
RUN apt-get -y install git build-essential cmake u-boot-tools automake libtool pkg-config libacl1-dev bc libz-dev libncurses5-dev libncursesw5-dev python python3 unrar kmod mtd-utils cpio lzop texinfo curl squashfs-tools u-boot-tools libssl-dev zip

RUN mkdir -p /opt/
COPY arm-ca9-linux-gnueabihf-6.5.tar.bz2 /opt
COPY setup_toolchain.sh /opt

RUN cd /opt; ./setup_toolchain.sh

WORKDIR /firmware

COPY build.sh .
COPY main.c .

RUN chmod +x build.sh
RUN ./build.sh
