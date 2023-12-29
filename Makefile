default: createdb

createdb:
	@docker compose up -d

startdb:
	@docker compose start

stopdb:
	@docker compose stop

dropdb:
	@docker compose down

migrateup:
	@migrate -path db/migrations -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose up

migratedown:
	@migrate -path db/migrations -database "postgres://admin:admin@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	@sqlc generate

test:
	@go test -v -cover ./...