# docker

This is a monorepo where I collect docker images and related utilities. Most, if not all, of these are rebuilt once a week and published on my Docker Hub profile: https://hub.docker.com/u/aczigler

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

## rethinkdb-backup

Docker-enabled backups for RethinkDB. It was originally taken from Tutum and we (Iteam) have adapted and used it since then.

```bash
docker pull aczigler/rethinkdb-backup
```

## syncthing

Back when I used Syncthing I also had a couple of mirrors deployed in the cloud. This is a simple and effective way to add redundancy, ensuring your files are safely stored in different physical locations.

```bash
docker pull aczigler/syncthing
```
