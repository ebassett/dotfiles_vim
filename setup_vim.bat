@echo off
setlocal enableextensions

cd %USERPROFILE%
md %USERPROFILE%\.vim\_backup
md %USERPROFILE%\.vim\_tmp
md %USERPROFILE%\.vim\_undo

md %USERPROFILE%\.vim\bundle\vundle
git clone https://github.com/gmarik/vundle.git %USERPROFILE%\.vim\bundle\vundle

mklink /d %USERPROFILE%\_vimfiles %USERPROFILE%\.vim
mklink %USERPROFILE%\_vimrc %USERPROFILE%\.vim\vimrc
REM Not strictly necessary, but I like it.
mklink %USERPROFILE%\.vimrc %USERPROFILE%\.vim\vimrc

gvim +PluginInstall

