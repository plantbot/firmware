#!/usr/bin/env bash

set -xeo pipefail

MAIN="main.lua"
MBAK="$MAIN.bak"
CREDENTIALS_TXT="credentials.txt"
mapfile -t SECRET < $CREDENTIALS_TXT
WIFI_SSID=${SECRET[0]}
WIFI_PASSWORD=${SECRET[1]}
SED_MAGIC="s/.*<CREDENTIALS>.*/WIFI_SSID='$WIFI_SSID'\nWIFI_PASSWORD='$WIFI_PASSWORD'/"

cp $MAIN $MBAK
cat $MAIN | sed "$SED_MAGIC" > main.lua

nodemcu-uploader upload main.lua

mv $MBAK $MAIN
