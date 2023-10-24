SHELL := /bin/bash -e

preview:
	mkdocs serve

deps:
	@mkdocs get-deps

deps-installed:
	@pip freeze | grep $$(mkdocs get-deps | xargs -I{} echo "-e {}.=" | tr '\n' ' ')

gh-deploy:
	mkdocs gh-deploy --force
