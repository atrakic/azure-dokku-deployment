
myapp=${1:-myapp}
your_cert_email="" # your email address for letsencrypt
_user="dokku"
_command="dokku"

fqdn=$(make -s -f ./infra/Makefile outputs | jq ".[].fqdn.value" | xargs)
ip=$(make -s -f ./infra/Makefile outputs | jq ".[].vmPublicIPAddress.value"| xargs)
dokku="ssh -o LogLevel=ERROR -o StrictHostKeychecking=no -o UserKnownHostsFile=/dev/null $_user@$fqdn $_command"
