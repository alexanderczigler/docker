#!/bin/sh

echo "Sync backups to S3"
s3cmd sync /backup s3://${S3_BUCKET}/${S3_DIR}/ --skip-existing

echo "Sync backups to sftp"
cd /backup
find . -name '*.psql.gz' -exec curl -v --insecure -T '{}' sftp://${SSH_USER}:${SSH_PASS}@${SSH_HOST}/${SSH_PATH}/'{}' \;