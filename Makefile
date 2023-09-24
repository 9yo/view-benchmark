run-dbs:
	docker compose --env-file .env -f docker-compose.yml stop
	docker compose --env-file .env -f docker-compose.yml rm
	docker volume rm view-benchmark-clickhouse-data
	docker volume rm view-benchmark-postgres-data
	docker volume create view-benchmark-clickhouse-data
	docker volume create view-benchmark-postgres-data
	docker compose --env-file .env -f docker-compose.yml up -d

postgres-instructions:
	chmod +x postgres_instructions.sh
	./postgres_instructions.sh

clickhouse_instructions:
	chmod +x clickhouse_instructions.sh
	./clickhouse_instructions.sh