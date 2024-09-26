#!/bin/bash

fqdn=$(make -s -f ./infra/Makefile outputs | jq ".[].fqdn.value" | xargs)
ip=$(make -s -f ./infra/Makefile outputs | jq ".[].vmPublicIPAddress.value"| xargs)
dokku="ssh -o StrictHostKeychecking=no -o UserKnownHostsFile=/dev/null $ip dokku"

echo ":: Using dokku on $fqdn ($ip) ::"
#$dokku version
$dokku apps:create myapp
#$dokku domains:add myapp myapp.com
#$dokku domains:add myapp www.myapp.com
#$dokku config:set myapp NODE_ENV=production
#$dokku config:set myapp MONGO_URL=mongodb://myuser:mypassword@myhost:myport/mydb
#$dokku config:set myapp ROOT_URL=http://www.myapp.com
#$dokku config:set myapp METEOR_SETTINGS='{"public": {"someSetting": "someValue"}}'
#$dokku config:set myapp BUILDPACK_URL=
#$dokku ps:rebuild myapp

git remote -v | grep -w dokku &>/dev/null || git remote add dokku dokku@dokku:myapp
git push dokku main

#$dokku apps:report myapp
#$dokku report myapp output
