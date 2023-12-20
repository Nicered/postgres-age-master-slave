# init-master.sh
#!/bin/bash
set -e

HOSTNAME="master-db"
IP_ADDRESS=$(getent hosts $HOSTNAME | awk '{ print $1 }')

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION age;
    CREATE ROLE $REPLICA_USER WITH LOGIN PASSWORD '$REPLICA_PASSWORD' REPLICATION;
EOSQL

echo "host replication $REPLICA_USER 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"