@ECHO OFF

REM Since it is difficult to use `make` in windows,
REM using `make.bat` is the easiest way to setup my env.

SET VIMRC_SRC=_.vimrc
SET VIMDIR_SRC=_.vim
SET CVIMRC_SRC=_.cvimrc

SET WGET_CMD=certutil.exe -urlcache -split -f
SET WGET_OUTPUT=
SET VIMRC_OBJ_WIN=%UserProfile%\_vimrc
SET VIMRC_OBJ_UNIX=%UserProfile%\.vimrc
SET VIMDIR_OBJ_WIN=%UserProfile%\vimfiles
SET VIMDIR_OBJ_UNIX=%UserProfile%\.vim
REM SET CVIMRC_SRC=%UserProfile%\_cvimrc

REM SET PLUGIN_MNG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
REM SET PLUGIN_MNG_NAME=plug.vim

ECHO "=================="
ECHO "grant this permission to set Local Policies\User Rights Assignment\Create symbolic links"
ECHO "=================="
start secpol.msc
PAUSE

RD /Q "%VIMRC_OBJ_WIN%"
RD /S /Q "%VIMDIR_OBJ_WIN%"
RD /Q "%VIMRC_OBJ_UNIX%"
RD /S /Q "%VIMDIR_OBJ_UNIX%"
MKLINK     "%VIMRC_OBJ_WIN%"   %CD%\%VIMRC_SRC%
MKLINK /J "%VIMDIR_OBJ_WIN%"  %CD%\%VIMDIR_SRC%
MKLINK     "%VIMRC_OBJ_UNIX%"     "%VIMRC_OBJ_WIN%"
MKLINK /J "%VIMDIR_OBJ_UNIX%"    "%VIMDIR_OBJ_WIN%"
REM MKDIR "%VIMDIR_OBJ_WIN%\autoload"
REM %WGET_CMD% %PLUGIN_MNG_URL% %WGET_OUTPUT% "%VIMDIR_OBJ_WIN%\autoload\%PLUGIN_MNG_NAME%"

ECHO "=================="
ECHO "Remove this permission to set Local Policies\User Rights Assignment\Create symbolic links"
ECHO "=================="
start secpol.msc
PAUSE

ECHO "Windows link is finished..."
PAUSE
