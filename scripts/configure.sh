#!/bin/bash

HERE=$(dirname $(readlink -f $0))
source $HERE/env.sh

echo ":: $(basename $0): Using dokku on $fqdn ($ip) ::"

$dokku apps:create "$myapp"
$dokku domains:add "$myapp" "$fqdn"

#$dokku config:set "$myapp" NODE_ENV=production
#$dokku config:set "$myapp" MONGO_URL=mongodb://myuser:mypassword@myhost:myport/mydb
#$dokku config:set "$myapp" ROOT_URL=http://www.myapp.com
#$dokku config:set "$myapp" METEOR_SETTINGS='{"public": {"someSetting": "someValue"}}'
#$dokku config:set "$myapp" BUILDPACK_URL=
#$dokku ps:rebuild "$myapp"

## https://github.com/dokku/dokku-letsencrypt?tab=readme-ov-file
if [ -n "$your_cert_email" ]; then
    $dokku letsencrypt:set --global email "$your_email"
    $dokku letsencrypt:enable "$myapp"
    $dokku letsencrypt:cron-job --add
fi
