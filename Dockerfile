# Version 0.0.1
FROM ubuntu:14.04

MAINTAINER Mike Bartoli "michael.bartoli@pomona.edu"

RUN apt-get update
RUN wget https://raw.githubusercontent.com/mbartoli/docker-moses/master/boost_1_58_0.tar.bz2
RUN tar xvf boost_1_58_0.tar.bz2
