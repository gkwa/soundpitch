build:
	docker compose up
	find . -type f \( -iname '*.deb' -o -iname '*.rpm' \)

clean:
	rm -f *.deb
	rm -f *.rpm
	docker compose down --remove-orphans

