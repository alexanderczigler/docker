# docker-cron

A debian-based image you can use to produce docker images running cronjob(s).

## Using

When building your image, base it on `registry.gitlab.com/alexanderczigler/docker-cron` and add your crontab.

Example Dockerfile:

```Dockerfile
FROM registry.gitlab.com/alexanderczigler/docker-cron

ADD crontab /etc/cron.d/crontab # NOTE: Keep the filename "crontab".
```
