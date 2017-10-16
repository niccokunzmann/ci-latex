FROM ubuntu:latest

# update the system
RUN apt-get -qq update
RUN apt-get -y -q install wget perl

# get texlive from http://tug.org/texlive/acquire-netinstall.html
RUN mkdir texlive && \
    cd texlive && \
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O- | tar zxf - && \
    cd *

# using installation profile http://tug.org/texlive/quickinstall.html
ADD installation.profile texlive/
RUN cd texlive/* && \
    ./install-tl --profile ../installation.profile

ENV PATH="/usr/local/texlive/2017/bin/x86_64-linux/:$PATH"
