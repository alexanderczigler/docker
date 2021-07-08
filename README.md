# docker

This is a monorepo where I collect usefyl docker images and related utilities. The images are rebuilt weekly and published on my [Docker Hub profile](https://hub.docker.com/u/iteamacr).

## cron

A debian-based image you can use to produce docker images running cronjob(s).

```bash
docker pull iteamacr/cron
```

When using this, base your image on the `iteamacr/cron` and create a file named `crontab` that you add to the image you are building. The file needs to be named `/etc/cron.d/crontab`. Unless you override the **CMD** of the image, it will tail the `/var/log/cron.log` so that you can see the output of your job(s).

Example crontab
```crontab
0 0,6,12,18 * * * /bin/sh /your-script.sh >> /var/log/cron.log
# NOTE: keep an empty line at the end

```

Example Dockerfile
```Dockerfile
FROM iteamacr/cron
ADD ./crontab /etc/cron.d/crontab # NOTE: Keep the filename "crontab".
```

## node-alpine-builder

When using multi-layered builds, this image is handy for the build/compile step.

```Dockerfile
FROM iteamacr/node-alpine-builder AS builder

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
docker pull iteamacr/node-full-icu
```

## postgres-backup

Docker-enabled backups for postgres. Capable of uploading backups to S3 and sftp as well as saving them locally.

```bash
docker pull iteamacr/postgres-backup
```
