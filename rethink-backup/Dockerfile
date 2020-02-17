FROM ubuntu:bionic

# Setup dependencies
RUN apt-get update && apt-get install -y wget gnupg && \
    . /etc/lsb-release && echo "deb https://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | \
    tee /etc/apt/sources.list.d/rethinkdb.list && \
    wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -

# Install rethinkdb and setup runtime
RUN apt-get update --fix-missing \
  && apt-get -y install python-pip \
  && apt-get install -y rethinkdb \
  && rm -rf /var/lib/apt/lists/* \
  && pip install rethinkdb \
  && mkdir /backups \
  && mkdir /scripts

ENV CRON_TIME="0 0 * * *"

ADD run.sh /run.sh

VOLUME ["/backups"]

CMD ["/run.sh"]
