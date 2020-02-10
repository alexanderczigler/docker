FROM alpine

# Ensure wget works with ssl
RUN apk update
RUN apk add ca-certificates wget
RUN update-ca-certificates

WORKDIR /syncthing

# Download and unpack syncthing
RUN wget -O syncthing.tar.gz https://github.com/syncthing/syncthing/releases/download/v0.14.10/syncthing-linux-amd64-v0.14.10.tar.gz
RUN tar zxvf syncthing.tar.gz
RUN mv syncthing-*/* .

# Add default config and init script
ADD ./config.default.xml /syncthing/config.default.xml
ADD init.sh /syncthing/init.sh

CMD /bin/sh init.sh