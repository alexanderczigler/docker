#!/bin/bash

# Ensure config dir exists.
mkdir -p /root/.config/syncthing

# Copy default config. (We start clean each time - all settings should come from env.)
cp config.default.xml config.xml

# Ensure web ui is accessible from outside. Use the -p flag in docker run to enable.
sed -i -- ""s/127.0.0.1/0.0.0.0/g"" config.xml

# Device to connect to.
sed -i -- ""s/__ST_DEVICE_ID__/$ST_DEVICE_ID/g"" config.xml
sed -i -- ""s/__ST_DEVICE_NAME__/$ST_DEVICE_NAME/g"" config.xml

# Folder
sed -i -- ""s/__ST_FOLDER_ID__/$ST_FOLDER_ID/g"" config.xml
sed -i -- ""s/__ST_FOLDER_NAME__/$ST_FOLDER_NAME/g"" config.xml

GEN_OUTPUT=`./syncthing -home=/syncthing -generate=/syncthing | grep "Device ID:"`
ID="${GEN_OUTPUT#*ID: }"
sed -i '/<\/folder>/a '"<device id=\"$ID\" name=\"$ST_NAME\" compression=\"metadata\" introducer=\"false\"><address>dynamic<\/address><\/device>" config.xml

./syncthing -home=/syncthing -no-browser