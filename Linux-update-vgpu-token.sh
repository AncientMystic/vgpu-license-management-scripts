#!/bin/bash
DLS_URL="https://<your-server-ip>"   # CHANGE THIS
TOKEN_DIR="/etc/nvidia/ClientConfigToken"
TIMESTAMP=$(date '+%d-%m-%Y-%H-%M-%S')
TOKEN_FILE="${TOKEN_DIR}/client_configuration_token_${TIMESTAMP}.tok"

mkdir -p "$TOKEN_DIR"
curl -k -L -X GET "$DLS_URL/-/client-token" -o "$TOKEN_FILE"
chmod 644 "$TOKEN_FILE"

systemctl restart nvidia-gridd
echo "Token updated and service restarted."
nvidia-smi -q | grep -A2 "License"