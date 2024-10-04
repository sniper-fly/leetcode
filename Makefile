up:
	docker compose up

down:
	docker compose down

sh:
	docker compose exec db sh

mysql:
	docker compose exec db mysql -u root -D puzzle
