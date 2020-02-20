# Create an image that host ltebox
FROM ubuntu:16.04
ENV container docker
ENV PATH "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y fuse snapd snap-confine squashfuse sudo &&\
 apt-get clean &&\
 dpkg-divert --local --rename --add /sbin/udevadm &&\
 ln -s /bin/true /sbin/udevadm

# Install tools needed
RUN apt-get install -y apt-utils
RUN apt-get install -y dnsutils
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping
RUN apt-get install -y vim
RUN apt-get install -y tcpdump
RUN apt-get install -y kmod
RUN apt-get install -y iptables
RUN apt-get install -y make
RUN apt-get install -y tmux

# Setup python to run app
RUN apt-get install -y python
RUN apt-get install -y python2.7-dev

RUN mv /usr/sbin/tcpdump /usr/bin/

# Use rc.local to help
RUN sed -i "13s/^/\/root\/init.sh/g" /etc/rc.local
RUN chmod +x /etc/rc.local
COPY ./init.sh /root/
COPY ./hook /root/
RUN mkdir /root/config
COPY ./conf.yaml /root/config/

# Copy hss_sim installer
COPY ./hss_sim0609_ubuntu.tgz /root/
COPY ./subscriber.data /root/

# Install LTEBox hss
RUN apt-get update
RUN tar zxvf /root/hss_sim0609_ubuntu.tgz -C /opt
RUN mv /root/subscriber.data /opt/hss_sim0609/

# Copy ltebox installer
COPY ./ltebox_3.2.2_ubuntu_16_amd64.deb /root/
COPY ./status.sh /status/
COPY ./xgwdebug.sh /status/
COPY ./mmedebug.sh /status/
COPY ./Makefile /
COPY ./setip.sh /root/
COPY ./s1ap_served_gunmei /

# Install LTEBox
RUN apt-get update
RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y libconfuse-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y liblog4c-dev
RUN apt-get install -y libgcrypt-dev
RUN apt-get install -y libsctp-dev
RUN dpkg -i /root/ltebox_3.2.2_ubuntu_16_amd64.deb
RUN cat s1ap_served_gunmei >> opt/ltebox/etc/mme.conf

# Start snapd
RUN systemctl enable snapd

VOLUME ["/sys/fs/cgroup"]
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
