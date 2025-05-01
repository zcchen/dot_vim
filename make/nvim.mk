CONFIG_SRCS = nvim

DEB_DEPENDS =
DEB_DEPENDS += luarocks     # lazy.nvim
DEB_DEPENDS += ripgrep      # telescope
DEB_DEPENDS += python3-venv # pylsp

CONFIG_DIR  = $(HOME)/.config
CONFIG_OBJS = $(foreach s,$(CONFIG_SRCS),$(CONFIG_DIR)/$(s))

REMOVE_CMD  = rm -if
LINK_CMD    = ln -snf

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

install: $(HOME_OBJS) $(CONFIG_OBJS)
	nvim +"Lazy install" +qall

deps:
	sudo apt install $(DEB_DEPENDS)

update: install
	nvim +"Lazy update" +qall

$(CONFIG_DIR)/%: %
	$(LINK_CMD) "$(CURDIR)/$<" $@
