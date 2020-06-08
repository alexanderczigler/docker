# postgres-backup

This image runs pg_dump to backup data using cronjob to folder `/backup`. Backups are named with date and time, the latest backup is linked to `/backup/latest.psql.gz`.

Uses Alpine Linux for a small (36 MB) image.

## Usage:

    docker run -d \
        --env PG_HOST=postgresdb.host \
        --env PG_PORT=5432 \
        --env PG_USER=admin \
        --env PG_PASS=password \
        --volume host.folder:/backup
        aczigler/postgres-backup

Moreover, if you link `aczigler/postgres-backup` to a postgres container with an alias named postgres, this image has defaults that will connect to `postgres` on port 5432 with user `root` and no password.

    docker run -d -e PG_ALLOW_EMPTY_PASSWORD=true --name postgresdb postgres
    docker run -d --link postgresdb:postgresdb -v host.folder:/backup aczigler/postgres-backup

## Parameters

    UID                   the user id, default: 65534
    GID                   the group id, default: 65534
    PG_HOST               the host/ip of your postgres database
    PG_PORT               the port number of your postgres database
    PG_USER               the username of your postgres database
    PG_PASS               the password of your postgres database
    PG_DB                 the database name to dump
    EXTRA_OPTS            the extra options to pass to pg_dump command
    CRON_TIME             the interval of cron job to run pg_dump. `0 0 * * *` by default, which is every day at 00:00
    MAX_BACKUPS           the number of backups to keep. When reaching the limit, the old backup will be discarded. No limit by default
    INIT_BACKUP           if set, create a backup when the container starts
    INIT_RESTORE_LATEST   if set, restores latest backup
    NO_CRON               if set, do not start cron. Must be used with INIT_BACKUP to run a single backup and then exit
    S3_BUCKET             the name of the Space where backups are synced
    S3_DIR                the dir where to sync the backup folder
    S3_HOST_BASE:         sometimes called s3 endpoint
    S3_HOST_BUCKET:       bucket url template string
    AWS_ACCESS_KEY_ID     the access key used to connect to the Space
    AWS_SECRET_ACCESS_KEY the secret used to connect to the Space

## Restore from a backup

See the list of backups, you can run:

    docker exec postgres-backup ls /backup

To restore database from a certain backup, simply run:

    docker exec postgres-backup /restore.sh /backup/2015-08-06_171901.psql.gz

### Restoring a very old backup

If you need to fetch a backup that is no longer stored in the running container, you can exec into the container/pod and use s3cmd to download it.

```bash
kubectl -n my-namespace exec -it postgres /bin/bash
cd /backup
s3cmd ls s3://my-bucket/postgres/local/backup/
s3cmd get s3://my-bucket/postgres/local/backup/2020-01-08_133700.psql.gz
sh /restore.sh /backup/2020-01-08_133700.psql.gz
```

