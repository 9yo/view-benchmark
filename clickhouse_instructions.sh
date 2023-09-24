. ./.env

echo "working with ${CLICKHOUSE_CONTAINER_NAME}, and table ${DATA_TABLE_NAME}"

docker exec -it "${CLICKHOUSE_CONTAINER_NAME}" clickhouse-client -u "${CLICKHOUSE_USER}" --password "${CLICKHOUSE_PASSWORD}" --database="${CLICKHOUSE_DB}" --query "CREATE TABLE ${DATA_TABLE_NAME}(post_id Int32,user_id Int32) ENGINE = MergeTree() ORDER BY user_id;"
# sed -i '1d' your_file.csv
docker exec -it "${CLICKHOUSE_CONTAINER_NAME}" clickhouse-client -u "${CLICKHOUSE_USER}" --password "${CLICKHOUSE_PASSWORD}" --database="${CLICKHOUSE_DB}" --query "INSERT INTO ${DATA_TABLE_NAME} FROM INFILE '/tmp/${DATASET_FILE_NAME}' FORMAT CSV;"
