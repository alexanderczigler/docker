# docker

This is a monorepo where I collect docker images and related utilities.

## cron

A debian-based image you can use to produce docker images running cronjob(s).

```bash
docker pull aczigler/cron
```

```Dockerfile
FROM aczigler/cron
ADD ./crontab /etc/cron.d/crontab # NOTE: Keep the filename "crontab".
```

## node-alpine-builder

When using multi-layered builds, this image is handy for the build/compile step.

```Dockerfile
FROM aczigler/node-alpine-builder AS builder

# Run npm install
RUN npm install --production

FROM node:11-alpine AS runner

# Copy output files from builder (only stuff needed for running your code)

```

## node-full-icu

NodeJS docker image with full-icu installed globally.

```bash
docker pull aczigler/node-full-icu
```

## rethink-backup

Docker-enabled backups for RethinkDB.

```bash
docker pull aczigler/rethink-backup
```

## syncthing

Run Syncthing mirrors in Docker!

```bash
docker pull aczigler/syncthing
```
