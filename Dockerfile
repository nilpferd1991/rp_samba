FROM resin/rpi-raspbian
MAINTAINER nilpferd1991

WORKDIR /root

RUN apt-get update && apt-get install -y samba && apt-get -y autoclean &&  apt-get -y autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd pi && useradd -g pi pi

ADD files/smb.conf /etc/samba/smb.conf

EXPOSE 138/udp
EXPOSE 139 
EXPOSE 445
EXPOSE 445/udp

VOLUME ["/media/data"]

RUN echo "service samba start" >> ~/.bashrc

CMD /bin/bash
