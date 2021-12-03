#!/bin/bash
export HELIUM_WALLET_PASSWORD="[unique long top secret password]"
KEYFILE="/config/wallet.key"
#EXCHANGE="coingecko" # bilaxy, binance

n=0
until [ "$n" -ge 2 ]; do
  echo "attempt $n ..."
  /usr/local/bin/helium-wallet -f "$KEYFILE" oracle report --block auto --price "$EXCHANGE" --commit 2>&1 && break
  n=$((n+1))
  sleep 5
done