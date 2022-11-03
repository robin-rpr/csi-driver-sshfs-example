ARG TAG=3.15
FROM sc4h/alpine-s6overlay:${TAG}

MAINTAINER Robin Röper <rr@linux.com>

ENV \
    SSHFS_HOST= \
    SSHFS_MNT= \
    SSHFS_OPTS=

# Install packages
RUN \
    echo "**** install packages ****" && \
    apk add --no-cache -U \
        fuse3 \
        sshfs && \
    sshfs -V && \
    echo "**** cleanup ****" && \
    rm -rf \
        /tmp/*

# Add local files
COPY root/ /

VOLUME ["/config"]
