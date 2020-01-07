@ECHO ON

REM Since it is difficult to use `make` in windows,
REM using `make.bat` is the easiest way to setup my env.

SET VIMRC_SRC="_.vimrc"
SET VIMDIR_SRC="_.vim"
SET CVIMRC_SRC="_.cvimrc"

SET REMOVE_CMD="del"
SET LINK_CMD="mklink"
SET MKDIR_CMD="mkdir"
SET PWD_CMD="cd"
SET WGET_CMD="certutil.exe -urlcache -split -f"
SET WGET_OUTPUT=""
SET VIMRC_OBJ_WIN="%HOME%/_vimrc"
SET VIMRC_OBJ_UNIX="%HOME%/.vimrc"
SET VIMDIR_OBJ_WIN="%HOME%/vimfiles"
SET VIMDIR_OBJ_UNIX="%HOME%/vimfiles"
REM SET CVIMRC_SRC="%HOME%/_cvimrc"

SET PLUGIN_MNG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
SET PLUGIN_MNG_NAME="plug.vim"


%LINK_CMD% /J %VIMRC_OBJ_WIN%   "%PWD_CMD%\\%VIMRC_SRC%"
%LINK_CMD% /J %VIMDIR_OBJ_WIN%  "%PWD_CMD%\\%VIMDIR_SRC%"
%LINK_CMD% %VIMRC_OBJ_UNIX%     %VIMRC_OBJ_WIN%
%LINK_CMD% %VIMDIR_OBJ_UNIX%    %VIMDIR_OBJ_WIN%
%MKDIR_CMD% "%VIMDIR_OBJ_WIN%\\autoload"
%WGET_CMD% "%PLUGIN_MNG_URL%" %WGET_OUTPUT% "%VIMDIR_OBJ_WIN%/autoload/%PLUGIN_MNG_NAME%"

ECHO "Windows link is finished..."
PAUSE
