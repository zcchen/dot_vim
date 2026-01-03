MAKEFILE_VIM = vim/Makefile
MAKEFILE_NVIM = nvim/Makefile

.PHONY: all
all: help

.PHONY: help
help:
	@echo "make < [vim/|nvim/]install | [vim/|nvim/]update | [vim/|nvim/]deps | [vim/|nvim/]uninstall >"
	@echo "       install: Install this plugin on this system via soft-links."
	@echo "       uninstall: Remove the plugin soft-links."
	@echo "       update: Update the plugins."
	@echo "       deps: Install the command depends on this system."


.PHONY: install
install: vim/install nvim/install

.PHONY: uninstall
uninstall: vim/uninstall nvim/uninstall

.PHONY: update
update: vim/update nvim/update

.PHONY: deps
deps: vim/deps nvim/deps


.PHONY: vim/%
vim/%:
	make -f $(MAKEFILE_VIM) $(subst vim/,,$@)

.PHONY: nvim/%
nvim/%:
	make -f $(MAKEFILE_NVIM) $(subst nvim/,,$@)

