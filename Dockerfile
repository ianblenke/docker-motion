FROM ubuntu:16.04

RUN apt-get update 
RUN apt-get build-dep -y motion

# Install the basic dependencies
RUN apt-get install -y autoconf automake pkgconf libtool libjpeg8-dev build-essential libzip-dev

# Install ffmpeg dependencies
RUN apt-get install -y libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev

# Install our dependencies
RUN apt-get install -y git
RUN git clone https://github.com/Motion-Project/motion /motion
WORKDIR /motion

RUN autoreconf -fiv
RUN ./configure
RUN make
RUN make install

ADD run.sh /run.sh

CMD /run.sh

