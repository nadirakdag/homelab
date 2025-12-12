#!/usr/bin/env bash

LOGFILE="setup.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "Logging enabled. Output will be written to $LOGFILE"

set -e

# Helper function to check if a container is healthy
check_container() {
  local name=$1
  local retries=20
  local count=0

  echo "Checking $name health..."
  while [ $count -lt $retries ]; do
    STATUS=$(docker inspect --format='{{.State.Health.Status}}' "$name" 2>/dev/null || echo "starting")

    if [ "$STATUS" = "healthy" ]; then
      echo "$name is healthy."
      return 0
    fi

    echo "$name not healthy yet (status: $STATUS)... retrying"
    sleep 3
    count=$((count+1))
  done

  echo "ERROR: $name failed to become healthy." >&2
  exit 1
}

echo "Starting Elasticsearch..."
docker-compose up -d elasticsearch

# Check Elasticsearch
check_container "elasticsearch"

echo "Creating Kibana service token..."
SERVICE_TOKEN=$(docker exec elasticsearch elasticsearch-service-tokens create elastic/kibana kibana-service-token | awk '/SERVICE_TOKEN/ {print $NF}')

echo "Service token created: $SERVICE_TOKEN"

echo "Exporting service token to environment..."
export SERVICE_TOKEN

echo "Starting Kibana..."
docker-compose up -d kibana

# Check Kibana
check_container "kibana"

echo "Done! Elasticsearch and Kibana are now running and healthy.""
