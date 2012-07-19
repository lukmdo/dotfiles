SHELL="/bin/bash"


.PHONY: clean sync

sync: clean
	@$(SHELL) sync_files.sh

clean:
	@echo "Removing ~, .swp files..."
	@find ./ -type f -name '*~' -exec rm -f {} \;
	@find ./ -type f -name '*swp' -exec rm -f {} \;