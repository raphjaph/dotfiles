#!/usr/bin/env bash
#set -euxo pipefail
set -euo pipefail

bitcoin-cli getrawtransaction 156a787e50ef1b912830ca1f495fbb2032a159d477844aa84dd63f777bb4db33 | xargs bitcoin-cli decoderawtransaction | jq '.vin[0].txinwitness[1]' | xargs bitcoin-cli decodescript | jq '.asm'
