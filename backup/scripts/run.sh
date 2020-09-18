#!/bin/bash

echo "0 0 0 * * sh /scripts/backup.sh" >/etc/crontabs/daily

crond -f -l 8
