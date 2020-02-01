#!/bin/sh
set -e

cd /opt/hashtopolis-agent-python

BASE_URL="$1"
API_KEY="$2"

VOUCHER="$(curl -v "$BASE_URL/api/user.php" -H 'Content-Type: application/json' --data-binary "{\"section\":\"agent\",\"request\":\"createVoucher\",\"accessKey\":\"$API_KEY\"}" | jq -r .voucher)"

exec python3 __main__.py  --voucher "$VOUCHER" --url "$BASE_URL/api/server.php"
