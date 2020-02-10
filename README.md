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

## node-full-icu

NodeJS docker image with full-icu installed globally.

```bash
docker pull aczigler/node-full-icu
```