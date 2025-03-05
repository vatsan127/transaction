docker run --name prometheus -v /path/to/prometheus-persistence:/opt/bitnami/prometheus/data bitnami/prometheus:latest

docker run --name prometheus -v path/to/prometheus.yml:/opt/bitnami/prometheus/conf/prometheus.yml bitnami/prometheus:latest

CREATE INDEX <INDEX_NAME> ON <TABLE_NAME>(COLUMN_NAME);

## Postgres

-- psql cmd
\l show db
\c change db
\d show tables
\q exit psql

psql -h localhost -p 5432 -U postgres -d dev
psql -U postgres -d dev


-- docker commands
docker run --name postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=dev --network database -p 5432:5432 -v postgres_data_vol:/var/lib/postgresql/data -d postgres:17

docker exec -it postgres psql -U postgres -d dev

docker run --name transaction-test-run  -e DB_HOST=postgres --network database transactions