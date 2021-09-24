VIMRC_SRC       = _.vimrc
VIMDIR_SRC      = _.vim
CVIMRC_SRC      = _.cvimrc

ifeq ($(OS),Windows_NT)
    REMOVE_CMD  = del
    LINK_CMD    = mklink /D
    PWD_CMD     = cd
    WGET_CMD    = certutil.exe -urlcache -split -f
    WGET_OUTPUT = 
    VIMRC_OBJ   = "%HOME%/_vimrc"
    VIMDIR_OBJ  = "%HOME%/vimfiles"
    #CVIMRC_SRC  = "%HOME%/_cvimrc"
else
    REMOVE_CMD  = rm -if
    LINK_CMD    = ln -snf
    PWD_CMD     = pwd
    WGET_CMD    = wget
    WGET_OUTPUT = -O
    VIMRC_OBJ   = "$${HOME}/.vimrc"
    VIMDIR_OBJ  = "$${HOME}/.vim"
    #CVIMRC_OBJ  = "$${HOME}/.cvimrc"
endif

PLUGIN_MNG_URL  = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUGIN_MNG_NAME = plug.vim

all: link update

link: vim-link

remove: vim-remove

clean: remove

vim-link:
	$(LINK_CMD) "$(PWD)/$(VIMRC_SRC)" $(VIMRC_OBJ)
	$(LINK_CMD) "$(PWD)/$(VIMDIR_SRC)" $(VIMDIR_OBJ)
	mkdir -p $(VIMDIR_OBJ)/autoload
	$(WGET_CMD) $(PLUGIN_MNG_URL) $(WGET_OUTPUT) $(VIMDIR_OBJ)/autoload/$(PLUGIN_MNG_NAME)
	#$(LINK_CMD) "$(PWD)/$(CVIMRC_SRC)" $(CVIMRC_OBJ)

vim-remove:
	$(REMOVE_CMD) $(VIMRC_OBJ)
	$(REMOVE_CMD) $(VIMDIR_OBJ)

update:
	vim +PlugInstall +qall

