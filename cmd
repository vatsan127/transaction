## Postgres

CREATE INDEX <INDEX_NAME> ON <TABLE_NAME>(COLUMN_NAME);

-- psql cmd
\l show db
\c change db
\d show tables
\q exit psql
\dt <schema-name>.* -- get all tables from a schema

psql -h localhost -p 5432 -U postgres -d dev
psql -U postgres -d dev

## Docker
docker run --name prometheus -d --network database -p 9090:9090 -v /home/steve/Git/transaction/src/main/resources/prometheus.yml:/opt/bitnami/prometheus/conf/prometheus.yml bitnami/prometheus:latest

docker run --name postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=dev --network database -p 5432:5432 -v postgres_data_vol:/var/lib/postgresql/data -d postgres:17

docker exec -it postgres psql -U postgres -d dev

docker cp employees.sql.gz postgres:home

docker images | grep 2025 | awk '{print $3}'

docker run --name prometheus -d --network database -p 9090:9090 -v /home/steve/Git/transaction/src/main/resources/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus:latest --config.file=/etc/prometheus/prometheus.yml


## Curl
curl localhost:8080/transaction/v1/actuator/prometheus


## Employees Sample data setup
CREATE DATABASE employees;
\c employees
CREATE SCHEMA employees;

pg_restore -d postgresql://[user]:[password]@[hostname]/employees -Fc employees.sql.gz -c -v --no-owner --no-privileges
pg_restore -d postgresql://postgres:postgres@localhost/employees -Fc employees.sql.gz -c -v --no-owner --no-privileges

psql postgresql://[user]:[password]@[neon_hostname]/employees
psql postgresql://postgres:postgres@localhost/employees

-- get all table details present in the schema
SELECT * FROM information_schema.tables
WHERE table_schema = 'employees' AND table_type = 'BASE TABLE';

SELECT * FROM pg_catalog.pg_tables WHERE schemaname = 'employees';

select * from employees.employee e ;
select * from employees.department d  ;
select * from employees.department_employee de ;
select * from employees.department_manager dm ;
select * from employees.salary s ;
select * from employees.title t ;


