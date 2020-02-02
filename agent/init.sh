#!/bin/bash
set -euo pipefail

mkdir -p /opt/agent
cd /opt/agent
rm -f ./agent.zip
wget "$BASE_URL/agents.php?download=1" -O ./agent.zip

if [ -f /opt/agent/config.json ]
then
    exec python3 ./agent.zip 
    exit 1
fi

BASE_URL="$1"
KEYTYPE="$2"
KEYVALUE="$3"

case "$KEYTYPE" in
    v*|V*)
        VOUCHER="$KEYVALUE"
        ;;
    a*|A*)
        VOUCHER="$(curl -v "$BASE_URL/api/user.php" -H 'Content-Type: application/json' --data-binary "{\"section\":\"agent\",\"request\":\"createVoucher\",\"accessKey\":\"$KEYVALUE\"}" | jq -r .voucher)"
        ;;
    *)
        echo "Invalid key type $KEYTYPE"
        exit 1
        ;;
esac

exec python3 ./agent.zip  --voucher "$VOUCHER" --url "$BASE_URL/api/server.php"
