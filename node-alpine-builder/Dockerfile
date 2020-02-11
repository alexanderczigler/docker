FROM node:11-alpine
LABEL maintainer="alexander@iteam.se"

RUN apk --no-cache add --virtual native-deps g++ gcc libgcc libstdc++ linux-headers make python

RUN npm config set unsafe-perm true
RUN npm install --quiet node-gyp -g
