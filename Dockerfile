FROM openjdk:10-jdk-slim

WORKDIR /root
RUN apt-get update \
 && apt-get install -y wget build-essential libcdb-dev libjuman zlib1g-dev git zip nano \
 && wget -O juman-7.01.tar.bz2 http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2 \
 && wget -O knp-4.19.tar.bz2 http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/knp-4.19.tar.bz2 \
 && tar jxvf juman-7.01.tar.bz2 \
 && tar jxvf knp-4.19.tar.bz2 \
 && mkdir usr \
 && cd /root/juman-7.01 \
 && ./configure --prefix=/root/usr/ \
 && make && make install && make clean \
 && cd /root/knp-4.19 \
 && ./configure --prefix=/root/usr/ -with-juman-prefix=/root/usr/ \
 && make && make install && make clean \
 && rm /root/juman-7.01.tar.bz2 \
 && rm /root/knp-4.19.tar.bz2 \
 && apt-get --purge -y autoremove wget build-essential
ENV PATH $PATH:/root/usr/bin
