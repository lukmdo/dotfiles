SHELL := /bin/bash -e

clean:
	rm -rf site

check_virtualenv:
	@test -n "$(VIRTUAL_ENV_PROMPT)" && test $(VIRTUAL_ENV_PROMPT) == "mkdocs" \
		|| (echo -e "activate virtualenv!\n\tworkon mkdocs" > /dev/stderr && exit 1)

preview: check_virtualenv clean
	mkdocs serve

deps: check_virtualenv
	@mkdocs get-deps

deps-installed: check_virtualenv
	@pip freeze | grep $$(mkdocs get-deps | xargs -I{} echo "-e {}.=" | tr '\n' ' ')

gh-deploy: check_virtualenv clean
	mkdocs gh-deploy --force
