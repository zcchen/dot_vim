HOME_SRCS   = vimrc vim
CONFIG_SRCS = nvim
DEB_DEPENDS = universal-ctags vim-youcompleteme neovim

HOME_DIR    = $${HOME}
CONFIG_DIR  = $${HOME}/.config
PLUGIN_OBJ  = $${HOME}/.vim/autoload/plug.vim

HOME_OBJS   = $(foreach s,$(HOME_SRCS),$(HOME_DIR)/.$(s))
CONFIG_OBJS = $(foreach s,$(CONFIG_SRCS),$(CONFIG_DIR)/$(s))

REMOVE_CMD  = rm -if
LINK_CMD    = ln -snf

PLUGIN_MNG_URL  = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUGIN_MNG_NAME = plug.vim

.PHONY: all clean
.PHONY: install update depends help

all: help

help:
	@echo "make < install | update | depends | uninstall >"
	@echo "       install: Install this plugin on this system via soft-links."
	@echo "       uninstall: Remove the plugin soft-links."
	@echo "       update: Update the plugins."
	@echo "       depends: Install the command depends on this system."

clean:
	$(REMOVE_CMD) $(HOME_OBJS)
	$(REMOVE_CMD) $(CONFIG_OBJS)

install: $(HOME_OBJS) $(CONFIG_OBJS) $(PLUGIN_OBJ)
	vim +PlugInstall! +qall

depends:
	sudo apt install $(DEB_DEPENDS)

update:
	vim +PlugUpdate! +qall


$(HOME_DIR)/.%: %
	$(LINK_CMD) "$(CURDIR)/$<" $@

$(CONFIG_DIR)/%: %
	$(LINK_CMD) "$(CURDIR)/$<" $@

$(PLUGIN_OBJ):
	mkdir -p $(dir $@)
	wget -c -O $@ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

