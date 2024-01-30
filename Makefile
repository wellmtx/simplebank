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

server:
	@go run main.go

test:
	@go test -v -cover ./...

mock:
	@mockgen -package mockdb -destination db/mock/store.go github.com/wellmtx/simplebank/db/sqlc Store

.PHONY: createdb startdb stopdb dropdb migrateup migratedown sqlc server test