FROM aczigler/cron

RUN mkdir /backup

# Install deps
RUN apt-get update && \
    apt-get -y install tzdata openssl wget lsb-release netcat \
    s3cmd curl

# Install PostgreSQL 11
RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN apt-get update && \
    apt-get -y install postgresql postgresql-contrib

ENV UID=65534 \
    GID=65534 \
    PG_DB="postgres" \
    PG_HOST="postgres" \
    PG_PORT="5432" \
    PG_USER="root" \
    PG_PASS="" \
    EXTRA_OPTS="--inserts"

ADD run.sh /run.sh

COPY crontab /etc/cron.d/crontab

COPY sync.sh /sync.sh
COPY .s3cfg /root/.s3cfg

VOLUME ["/backup"]
CMD ["/run.sh"]
