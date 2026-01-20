ECHO OFF
SETLOCAL

REM Since it is difficult to use `make` in windows,
REM using `make.bat` is the easiest way to setup my env.

SET PLUGIN_MNG_NAME=plug.vim
SET PLUGIN_MNG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/0.11.0/%PLUGIN_MNG_NAME%"

SET VIMDIR_OBJ=%UserProfile%\vimfiles

:main
    echo "--- vim dotfile: remove dir '%VIMDIR_OBJ%' and re-link it."
    rmdir /s /q "%VIMDIR_OBJ%"
    CALL :do_link_vimfiles
    echo "--- vim dotfile: '%VIMDIR_OBJ%' is ready."
    IF NOT EXIST "%VIMDIR_OBJ%\autoload\%PLUGIN_MNG_NAME%" (
        CALL :do_download_plugin_manager
    )
    echo "--- vim dotfile: plugin manager '%PLUGIN_MNG_NAME%' is ready."
    CALL :do_install_plugins
    echo "--- vim dotfile: plugins are installed."
    pause
    GOTO :EOF

:do_link_vimfiles
    MKLINK /J %VIMDIR_OBJ% %CD%\vim
    REM REM dir "%UserProfile%\.vim" is for win32unix sub-systems (like git-windows)
    REM MKLINK /J %UserProfile%\.vim %VIMDIR_OBJ% 
    GOTO :EOF

:do_download_plugin_manager
    IF NOT EXIST "%VIMDIR_OBJ%\autoload" (
        MKDIR "%VIMDIR_OBJ%\autoload"
    )
    curl %PLUGIN_MNG_URL% -o "%VIMDIR_OBJ%\autoload\%PLUGIN_MNG_NAME%"
    GOTO :EOF

:do_install_plugins
    cmd /c vim +PlugInstall! +qall
    GOTO :EOF

