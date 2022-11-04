**Status:** Experimental (only for development, expect crashes)
<img height="171px" align="right" alt="DOCKER-SSHFS" src="https://raw.githubusercontent.com/robin-rpr/docker-sshfs/master/docker-sshfs.svg" title="docker-sshfs"/>


# Docker SSHFS
Mount SSHFS on the host with a container.

Command executed in the container:

- `sshfs -f ${SSHFS_HOST} ${SSHFS_MNT} ${SSHFS_OPTS}`

## Usage

```bash
docker create --name=sshfs \
    -e PUID=<uid> \
    -e PGID=<gid> \
    -e TZ=<timezone> \
    -e SSHFS_HOST="<user>@<host>:<path>" \
    -e SSHFS_OPTS="-p <port> -o IdentityFile=/config/<ssh_key> -o noatime -o reconnect" \
    --cap-add=SYS_ADMIN \
    --device=/dev/fuse \
    -v <config_path>:/config \
    -v <mnt_path>:/mnt:shared \
    ghcr.io/robin-rpr/docker-sshfs:main
```

```bash
docker start sshfs
```

