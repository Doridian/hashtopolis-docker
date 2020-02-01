#!/bin/bash
set -euo pipefail

if [ -f /opt/agent/config.json ]
then
    cd /opt/agent
    exec python3 ./agent.zip 
    exit 1
fi

rm -rf /opt/agent
mkdir -p /opt/agent
cd /opt/agent

BASE_URL="$1"
API_KEY="$2"

VOUCHER="$(curl -v "$BASE_URL/api/user.php" -H 'Content-Type: application/json' --data-binary "{\"section\":\"agent\",\"request\":\"createVoucher\",\"accessKey\":\"$API_KEY\"}" | jq -r .voucher)"

wget "$BASE_URL/agents.php?download=1" -O ./agent.zip

exec python3 ./agent.zip  --voucher "$VOUCHER" --url "$BASE_URL/api/server.php"
