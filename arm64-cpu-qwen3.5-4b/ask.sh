#!/bin/bash

port=${2:-8000}
host=${3:-localhost}

if test -z "$1"; then
  echo Question is required
  exit 0
fi

curl http://$host:$port/v1/chat/completions \
  -H 'Content-Type: application/json' \
  -d "{\"model\": \"unsloth/Qwen3.5-4B-GGUF:Q4_K_M\", \"messages\": [{\"role\": \"user\", \"content\": \"$1\"}], \"stream\": false, \"stop\": [\"<|im_end|>\"]}" -s | python -m json.tool --no-ensure-ascii
