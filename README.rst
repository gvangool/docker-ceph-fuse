Ceph-fuse
=========
Very simplistic docker container that will run ceph-fuse and mount it on
``/data``.

Usage
-----
During deployment, you still need to add your Ceph configuration files in
``/etc/ceph``. This is done via ``ONBUILD`` instructions for

- ``ceph.conf``
- ``ceph.client.admin.keyring``

Create a ``Dockerfile`` containing ``FROM gvangool/ceph-fuse``. In your run
scripts you can can start ceph-fuse by just passing::

  ceph-fuse /data

Note #1
~~~~~~~
You need to add extra sys-capabilities to use fuse. Until I've figured out
which ones exactly, run it with ``--privileged``.

Note #2
~~~~~~~
Thea idea was to share a mounted directory and share it via Docker's volume's
to other containers. Apparently that doesn't work.
