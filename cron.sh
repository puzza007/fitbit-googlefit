#!/bin/sh

cd $(dirname $0)

export PATH=$PATH:/usr/local/bin
export LANG=C.UTF-8

pipenv run python3 app.py -g /config/google.json -f /config/fitbit.json -c /config/config.ini -d
