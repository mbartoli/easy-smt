# Version 0.0.1
FROM ubuntu:14.04

MAINTAINER Mike Bartoli "michael.bartoli@pomona.edu"

RUN apt-get update
RUN apt-get install -y \
   build-essential \
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
RUN mkdir /home/moses
RUN wget -O /home/moses/boost_1_58_0.tar.bz2 https://raw.githubusercontent.com/mbartoli/docker-support/master/boost_1_58_0.tar.bz2
RUN tar -xvf /home/moses/boost_1_58_0.tar.bz
RUN ./bootstrap.sh
RUN ./b2 -j8 --prefix=$PWD --libdir=$PWD/lib64 --layout=system link=static install || echo FAILURE

# install giza++
#RUN wget -O /home/moses/giza-pp.zip "http://github.com/moses-smt/giza-pp/archive/master.zip" 
#RUN unzip /home/moses/giza-pp.zip
#RUN rm /home/moses/giza-pp.zip
#RUN mv /home/moses/giza-pp-master giza-pp
#WORKDIR /home/moses/giza-pp
#RUN make
