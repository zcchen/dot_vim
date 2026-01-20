#CONFIG_SRCS = vimrc vim
CONFIG_SRCS = vim

DEB_DEPENDS =
DEB_DEPENDS += universal-ctags
DEB_DEPENDS += vim-youcompleteme
# DEB_DEPENDS += python3-flake8

CONFIG_DIR  = $(HOME)/
CONFIG_OBJS = $(foreach s,$(CONFIG_SRCS),$(CONFIG_DIR)/.$(s))

PLUGIN_OBJ  = $(HOME)/.vim/autoload/plug.vim

REMOVE_CMD  = rm -if
LINK_CMD    = ln -snf

PLUGIN_MNG_URL  = https://raw.githubusercontent.com/junegunn/vim-plug/0.11.0/plug.vim
PLUGIN_MNG_NAME = plug.vim

.PHONY: all clean
.PHONY: install update depends help

all: help

help:
	@echo "make < install | update | deps | uninstall >"
	@echo "       install: Install this plugin on this system via soft-links."
	@echo "       uninstall: Remove the plugin soft-links."
	@echo "       update: Update the plugins."
	@echo "       deps: Install the command depends on this system."

uninstall:
	$(REMOVE_CMD) $(CONFIG_OBJS)

install: $(CONFIG_OBJS) $(PLUGIN_OBJ) deps
	vim +PlugInstall! +qall

deps:
	sudo apt install $(DEB_DEPENDS)

update: install
	vim +PlugUpdate! +qall

$(CONFIG_DIR)/.%: %
	$(LINK_CMD) "$(CURDIR)/$<" $@

$(PLUGIN_OBJ): $(CONFIG_OBJS)
	mkdir -p $(dir $@)
	wget "$(PLUGIN_MNG_URL)" -O $@
