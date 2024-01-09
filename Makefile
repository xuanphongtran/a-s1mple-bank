postgres:
	docker run --name postgres16 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:16-alpine
createdb: 
	docker exec -it postgres16 createdb --username=root --owner=root s1mple_bank
dropdb:
	docker exec -it postgres16 dropdb s1mple_bank
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/s1mple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/s1mple_bank?sslmode=disable" -verbose down
sqlcinit:
	docker run --rm -v E:\Study\Gaulang\a-s1mple-bank:/src -w /src sqlc/sqlc init
sqlc:
	docker run --rm -v E:\Study\Gaulang\a-s1mple-bank:/src -w /src sqlc/sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlcinit  sqlc