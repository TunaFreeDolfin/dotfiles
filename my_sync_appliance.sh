#!/bin/bash

set -o errexit
set -o nounset

if [ $# -ne 1 ]; then
    echo "Error, sync appliance must specify IP of the appliance to sync to"
    exit 1
fi

readonly APPLIANCE_IP=$1

readonly MAYTAG_DIR="~/maytag"
readonly APP_ADMIN_HOST=app-admin@$APPLIANCE_IP

ssh $APP_ADMIN_HOST "mkdir -p $MAYTAG_DIR"
rsync -avz -e ssh $PWD $APP_ADMIN_HOST:$MAYTAG_DIR
