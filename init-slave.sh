# init-slave.sh
#!/bin/bash
set -e

# Stop the server if it's running
pg_isready && pg_ctl -D "$PGDATA" -m fast -w stop

rm -rf "$PGDATA"/*

# Wait until the master server is accessible
while ! PGPASSWORD=$REPLICA_PASSWORD psql -h master-db -d $POSTGRES_DB -U $REPLICA_USER -c '\q'; do
  echo "Waiting for master server..."
  sleep 5
done

PGPASSWORD=$REPLICA_PASSWORD pg_basebackup -h master-db -D "$PGDATA" -U $REPLICA_USER -v -P --wal-method=stream

echo "primary_conninfo = 'host=master-db port=5432 user=$REPLICA_USER password=$REPLICA_PASSWORD'" >> "$PGDATA"/postgresql.conf

# Ensure the standby.signal file is present
touch "$PGDATA"/standby.signal

# Start the server
postgres -D "$PGDATA" -c listen_addresses='*'