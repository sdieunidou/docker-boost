FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN rm /etc/localtime  \
	&& ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

RUN apt-get update \
	&& apt-get install -y \
	devscripts \
	build-essential \
	lintian \
	dh-make \
	g++ \
	autoconf \
	libtool \
	git  \
	wget \
	build-essential \
	libbz2-dev \
	libicu-dev \
	libpthread-stubs0-dev \
	libssl-dev \
	zlib1g-dev 

RUN cd /opt  \
	&& wget https://cmake.org/files/v3.10/cmake-3.10.1-Linux-x86_64.tar.gz \
	&& tar -zxvf cmake-3.10.1-Linux-x86_64.tar.gz \
	&& ln -s /opt/cmake-3.10.1-Linux-x86_64/bin/cmake /usr/bin/cmake

RUN cd /home \
     && wget http://downloads.sourceforge.net/project/boost/boost/1.64.0/boost_1_64_0.tar.gz \
     && tar xfz boost_1_64_0.tar.gz \
     && rm boost_1_64_0.tar.gz \
     && cd boost_1_64_0 \
     && ./bootstrap.sh --prefix=/usr/local \
     && ./b2 install \
     && cd .. \
     && rm -rf boost_1_64_0 \
     && ldconfig; exit 0

ENTRYPOINT /bin/bash
