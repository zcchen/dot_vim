HOME_SRCS   = vimrc vim
CONFIG_SRCS = nvim

HOME_DIR    = $${HOME}
CONFIG_DIR  = $${HOME}/.config
PLUGIN_OBJ  = $${HOME}/.vim/autoload/plug.vim

HOME_OBJS   = $(foreach s,$(HOME_SRCS),$(HOME_DIR)/.$(s))
CONFIG_OBJS = $(foreach s,$(CONFIG_SRCS),$(CONFIG_DIR)/$(s))

REMOVE_CMD  = rm -if
LINK_CMD    = ln -snf

PLUGIN_MNG_URL  = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUGIN_MNG_NAME = plug.vim

all: link update
clean: remove

link: $(HOME_OBJS) $(CONFIG_OBJS) $(PLUGIN_OBJ)

remove:
	$(REMOVE_CMD) $(HOME_OBJS)
	$(REMOVE_CMD) $(CONFIG_OBJS)

update:
	vim +PlugInstall! +qall
	vim +PlugUpdate! +qall


$(HOME_DIR)/.%: %
	$(LINK_CMD) "$(CURDIR)/$<" $@

$(CONFIG_DIR)/%: %
	$(LINK_CMD) "$(CURDIR)/$<" $@

$(PLUGIN_OBJ):
	mkdir -p $(dir $@)
	wget -O $@ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
