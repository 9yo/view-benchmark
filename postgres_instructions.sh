. ./.env
echo "working with ${POSTGRES_CONTAINER_NAME}, and table ${DATA_TABLE_NAME}"

docker exec -it "${POSTGRES_CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c "CREATE TABLE ${DATA_TABLE_NAME}(post_id int, user_id int);"
docker exec -it "${POSTGRES_CONTAINER_NAME}" psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c "COPY ${DATA_TABLE_NAME}(post_id, user_id) FROM '/tmp/${DATASET_FILE_NAME}' DELIMITER ',' CSV HEADER;"