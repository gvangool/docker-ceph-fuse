FROM centos:centos7
MAINTAINER Gert Van Gool <gertvangool@gmail.com>

# Ceph ships more recent versions of certain packages so allow overwriting
RUN yum install -y yum-plugin-priorities && yum clean all
# Can't upgrade systemd so install the "default" version
RUN yum install -y systemd-sysv-208-11.el7 && yum clean all
# Add repo & install Ceph
ADD ceph.repo /etc/yum.repos.d/
RUN yum install -y ceph-fuse && yum clean all

# Create mount point
RUN mkdir /data

ONBUILD ADD ceph.conf /etc/ceph/
ONBUILD ADD ceph.client.admin.keyring /etc/ceph/

CMD ["ceph-fuse", "-f", "/data"]
