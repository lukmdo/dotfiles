SHELL="/bin/bash"


.PHONY: clean vimtools sync

sync: clean vimtools
	@echo "---> Sync"
	@$(SHELL) sync_files.sh -d "$(DIR)" -f "$(FILE)"

vimtools:
	@echo "---> Setup vim"
	@mkdir -p "$(HOME)/.vim/plugin"
	@-cp -vn .vim/plugin/DirDiff.vim "$(HOME)/.vim/plugin/DirDiff.vim"
	@-cp -vn .vimrc "$(HOME)/"

clean:
	@echo "---> Removing temporary files"
	@find ./ -type f -name '*~' -exec rm -f {} \;
	@find ./ -type f -name '*swp' -exec rm -f {} \;
