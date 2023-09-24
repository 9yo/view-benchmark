# view-benchmark
Comparing PostgreSQL and Clickhouse for performance in own purposes.

## How to run

``` bash
# first
source .env

make run-dbs
make postgres-instructions

# edit dataset with this command, remove first line (headers)
sed -i '1d' ${DATASET_FILE_NAME}
make clickhouse_instructions


# clickhouse available on
docker exec -it "${CLICKHOUSE_CONTAINER_NAME}" clickhouse-client -u "${CLICKHOUSE_USER}" --password "${CLICKHOUSE_PASSWORD}" --database="${CLICKHOUSE_DB}"

# postgres available on
docker exec -it "${POSTGRES_CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}"

# select * from view_benchmark.user_post_view where user_id=7;
```
