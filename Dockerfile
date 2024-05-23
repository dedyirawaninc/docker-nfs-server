FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq
RUN apt-get install -y nfs-kernel-server -qq
RUN apt-get install -y inotify-tools -qq
RUN apt-get install -y runit -qq

RUN mkdir -p /exports
RUN mkdir -p /etc/sv/nfs

ADD nfs_setup.sh /usr/local/bin/nfs_setup
ADD nfs.init /etc/sv/nfs/run
ADD nfs.stop /etc/sv/nfs/finish

RUN echo "nfs             2049/tcp" >> /etc/services
RUN echo "nfs             111/udp" >> /etc/services

VOLUME /exports

EXPOSE 111/udp 2049/tcp

ENTRYPOINT ["/usr/local/bin/nfs_setup"]
