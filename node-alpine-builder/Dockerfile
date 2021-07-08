ARG NODE_VERSION=16

FROM node:${NODE_VERSION}-alpine
LABEL maintainer="alexander@iteam.se"

RUN apk --no-cache add --virtual native-deps g++ gcc libgcc libstdc++ linux-headers make python3

RUN npm config set unsafe-perm true
RUN npm install --quiet node-gyp -g
