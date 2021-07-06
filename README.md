# docker

This is a monorepo where I collect docker images and related utilities. Most, if not all, of these are rebuilt once a week and published on my Docker Hub profile: https://hub.docker.com/u/docker.pkg.github.com/alexanderczigler/docker

## cron

A debian-based image you can use to produce docker images running cronjob(s).

```bash
docker pull docker.pkg.github.com/alexanderczigler/docker/cron
```

```Dockerfile
FROM docker.pkg.github.com/alexanderczigler/docker/cron
ADD ./crontab /etc/cron.d/crontab # NOTE: Keep the filename "crontab".
```

## node-alpine-builder

When using multi-layered builds, this image is handy for the build/compile step.

```Dockerfile
FROM docker.pkg.github.com/alexanderczigler/docker/node-alpine-builder AS builder

# Run npm install
RUN npm install --production

...

FROM node:11-alpine AS runner

# Copy output files from builder (only stuff needed for running your code)
...

CMD node index.js

```

## node-full-icu

NodeJS docker image with full-icu installed globally.

```bash
docker pull docker.pkg.github.com/alexanderczigler/docker/node-full-icu
```

## postgres-backup

Docker-enabled backups for postgres. Capable of uploading backups to S3 and sftp as well as saving them locally.

```bash
docker pull docker.pkg.github.com/alexanderczigler/docker/postgres-backup
```
