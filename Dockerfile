# Version 0.0.1
FROM ubuntu:14.04

MAINTAINER Mike Bartoli "michael.bartoli@pomona.edu"

RUN apt-get update
RUN apt-get install -y \
   build-essential
   wget \
   g++ \
   git \
   subversion \
   automake \
   libtool \
   zlib1g-dev \
   libboost-all-dev \
   libbz2-dev \
   liblzma-dev \
   python-dev \
   libgoogle-perftools-dev 

# install boost
RUN wget https://raw.githubusercontent.com/mbartoli/docker-support/master/boost_1_58_0.tar.bz2
RUN tar -xvf boost_1_58_0.tar.bz
RUN ./bootstrap.sh
RUN ./b2 -j8 --prefix=$PWD --libdir=$PWD/lib64 --layout=system link=static install || echo FAILURE



