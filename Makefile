SHELL="/bin/bash"


.PHONY: clean sync

sync: clean
	@$(SHELL) sync_files.sh -d "$(DIR)" -f "$(FILE)"

clean:
	@echo "Removing temp files..."
	@find ./ -type f -name '*~' -exec rm -f {} \;
	@find ./ -type f -name '*swp' -exec rm -f {} \;