#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTOC_BIN="${PROTOC_BIN:-protoc}"

echo "Using protoc: ${PROTOC_BIN}"

mkdir -p "${ROOT}/gen/vpn/v1"

echo "Generating Go code for api.proto into gen/vpn/v1..."
"${PROTOC_BIN}" \
  -I "${ROOT}" \
  --go_out=paths=source_relative:"${ROOT}/gen" \
  --go-grpc_out=paths=source_relative:"${ROOT}/gen" \
  "${ROOT}/api.proto"

echo "Done."


