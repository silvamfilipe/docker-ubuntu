# Pull base image
FROM ubuntu:14.04.2
MAINTAINER Filipe Silva <silvam.filipe@gmail.com>

# Install
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get upgrade -y &&\
  apt-get install -y \
  	build-essential \
  	software-properties-common \
  	byobu curl git htop man unzip vim nano wget &&\
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]  