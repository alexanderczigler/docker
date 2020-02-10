# docker-cron

A debian-based image you can use to produce docker images running cronjob(s).

## Using

When building your image, base it on `docker.pkg.github.com/alexanderczigler/docker-cron/docker-cron:latest` and add your crontab.

Example Dockerfile:

```Dockerfile
FROM docker.pkg.github.com/alexanderczigler/docker-cron/docker-cron:latest

ADD crontab /etc/cron.d/crontab # NOTE: Keep the filename "crontab".
```
