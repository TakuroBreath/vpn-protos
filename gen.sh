#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTOC_BIN="${PROTOC_BIN:-protoc}"

echo "Using protoc: ${PROTOC_BIN}"

mkdir -p "${ROOT}/gen/agent" "${ROOT}/gen/api"

echo "Generating Go code for agent.proto into gen/agent..."
"${PROTOC_BIN}" \
  -I "${ROOT}" \
  --go_out=paths=source_relative:"${ROOT}/gen/agent" \
  --go-grpc_out=paths=source_relative:"${ROOT}/gen/agent" \
  "${ROOT}/agent.proto"

echo "Generating Go code for api.proto into gen/api..."
"${PROTOC_BIN}" \
  -I "${ROOT}" \
  --go_out=paths=source_relative:"${ROOT}/gen/api" \
  --go-grpc_out=paths=source_relative:"${ROOT}/gen/api" \
  "${ROOT}/api.proto"

echo "Done."


