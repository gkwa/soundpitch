build:
	rm -f *.deb *.rpm
	docker compose down --remove-orphans
	docker compose build
	docker compose up
	du -sh *.deb *.rpm

clean:
	rm -f *.deb *.rpm
	docker compose down --remove-orphans

verycleanbuild:
	docker compose build --no-cache
	docker compose up
	du -sh *.deb *.rpm
