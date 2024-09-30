#!/bin/bash

HERE=$(dirname $(readlink -f $0))
source $HERE/env.sh

echo ":: $(basename $0): Using dokku on $fqdn ($ip) ::"

$dokku storage:ensure-directory "$myapp"--db
$dokku storage:mount $myapp \
    /var/lib/dokku/data/storage/"$myapp"--db:/app/db/litestream

$dokku litestream:create "$myapp" /var/lib/dokku/data/storage/"$myapp"--db \
    production.sqlite3 s3://my-backup-bucket/"$myapp"/production.sqlite3

$dokku litestream:start "$myapp"
$dokku litestream:logs "$myapp"

# Restore
#$dokku litestream:restore /var/lib/dokku/data/storage/copy-my-sqlite-application--db \
#    production.sqlite3 s3://"$mybucket"/"$myapp"/production.sqlite3
