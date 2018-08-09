FROM openjdk:10-jre-slim

RUN apt-get update
RUN apt-get update
RUN apt-get install -y wget build-essential libcdb-dev libjuman zlib1g-dev git
WORKDIR /root
RUN wget -O juman-7.01.tar.bz2 http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2
RUN wget -O knp-4.19.tar.bz2 http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/knp-4.19.tar.bz2
RUN tar jxvf juman-7.01.tar.bz2
RUN tar jxvf knp-4.19.tar.bz2
RUN mkdir usr
WORKDIR /root/juman-7.01
RUN ./configure --prefix=/root/usr/
RUN make
RUN make install
WORKDIR /root/knp-4.19
RUN ./configure --prefix=/root/usr/ -with-juman-prefix=/root/usr/
RUN make
RUN make install
ENV PATH $PATH:/root/usr/bin
WORKDIR /root
