#!/bin/bash

# Define PostgreSQL data directory
PGDATA="/var/lib/postgresql/17/main"

pg_ctlcluster 17 main start

until pg_isready -h localhost -p 5432
do
  echo "Waiting for PostgreSQL to start..."
  sleep 1
done

echo "PostgreSQL has been initialized."

echo "Start Grafana Server"
echo -e "[server]\nhttp_port = $GRAFANA_PORT" > /etc/grafana/grafana.ini
service grafana-server start

tail -f /dev/null