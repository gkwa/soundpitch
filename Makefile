build:
	docker compose build
	docker compose up
	ls *.deb *.rpm

cleanbuild:
	docker compose build --no-cache
	docker compose up
	ls *.deb *.rpm

clean:
	rm -f *.deb *.rpm
	docker compose down --remove-orphans

