MAKEFILE_VIM = make/vim.mk
MAKEFILE_VIM = make/nvim.mk

.PHONY: all help clean install update depends
all: help

help:
	@echo "make < [vim/|nvim/]install | [vim/|nvim/]update | [vim/|nvim/]deps | [vim/|nvim/]uninstall >"
	@echo "       install: Install this plugin on this system via soft-links."
	@echo "       uninstall: Remove the plugin soft-links."
	@echo "       update: Update the plugins."
	@echo "       deps: Install the command depends on this system."


install: vim/install nvim/install
uninstall: vim/uninstall nvim/uninstall
update: vim/update nvim/update
deps: vim/deps nvim/deps

vim/install:
	make -f $(MAKEFILE_VIM) install

nvim/install:
	make -f $(MAKEFILE_NVIM) install

vim/uninstall:
	make -f $(MAKEFILE_VIM) uninstall

nvim/uninstall:
	make -f $(MAKEFILE_NVIM) uninstall

vim/update:
	make -f $(MAKEFILE_VIM) update

nvim/update:
	make -f $(MAKEFILE_NVIM) update

vim/deps:
	make -f $(MAKEFILE_VIM) deps

nvim/deps:
	make -f $(MAKEFILE_NVIM) deps
