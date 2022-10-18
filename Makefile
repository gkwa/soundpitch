build:
	docker compose down --remove-orphans
	docker compose build
	docker compose up

clean:
	docker compose down --remove-orphans

verycleanbuild:
	docker compose down --remove-orphans
	docker compose build --no-cache
	docker compose up

push:
	docker compose push
