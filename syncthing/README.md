# syncthing

An approach to running syncthing in docker.

This repo can be used to create a container running syncthing with the settings and keys of your choise. Useful if you want a simple way to setup a mirror for your files somewhere.

## example stack

```
syncthing:
  build: .
  environment: 
    - 'ST_DEVICE_ID=ABC121W-V5494MC-P8BUPAJ-3JACAN8-KQ9C4AX-PGF522Z-AM81O4G-A10RJOF'
    - 'ST_DEVICE_NAME=stella'
    - 'ST_FOLDER_ID=bafra-nqjcc'
    - 'ST_FOLDER_NAME=mobile-camera'
  ports:
    - 8384:8384
    - 22000:22000
```