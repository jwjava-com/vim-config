@echo off

setlocal EnableExtensions EnableDelayedExpansion

set CYGWINPATH="C:\dev\cygwin64"
set VIMCONFIG="C:\dev\cfg\vim-config"
set VIMINSTALL="C:\dev\vim"

if not exist "%CYGWINPATH%\home\%USERNAME%" (
    @echo Aborting...
    @echo Directory not found: "%CYGWINPATH%\home\%USERNAME%"
    goto:eof
)
if not exist "%VIMCONFIG%" (
    @echo Aborting...
    @echo Directory not found: "%VIMCONFIG%"
    goto:eof
)
if not exist "%VIMINSTALL%" (
    @echo Aborting...
    @echo Directory not found: "%VIMINSTALL%"
    goto:eof
)

@echo Cleaning up any pre-existing files...
if exist "%CYGWINPATH%\home\%USERNAME%\.gvimrc"  del /f /q "%CYGWINPATH%\home\%USERNAME%\.gvimrc"        
if exist "%CYGWINPATH%\home\%USERNAME%\_gvimrc"  del /f /q "%CYGWINPATH%\home\%USERNAME%\_gvimrc"        
if exist "%CYGWINPATH%\home\%USERNAME%\.vimrc"   del /f /q "%CYGWINPATH%\home\%USERNAME%\.vimrc"        
if exist "%CYGWINPATH%\home\%USERNAME%\_vimrc"   del /f /q "%CYGWINPATH%\home\%USERNAME%\_vimrc"        
if exist "%CYGWINPATH%\home\%USERNAME%\.viminfo" del /f /q "%CYGWINPATH%\home\%USERNAME%\.viminfo"        
if exist "%CYGWINPATH%\home\%USERNAME%\_viminfo" del /f /q "%CYGWINPATH%\home\%USERNAME%\_viminfo"        
if exist "%CYGWINPATH%\home\%USERNAME%\.vim"     rd /q     "%CYGWINPATH%\home\%USERNAME%\.vim"        

if exist "%VIMINSTALL%\.gvimrc"                  del /f /q "%VIMINSTALL%\.gvimrc"
if exist "%VIMINSTALL%\_gvimrc"                  del /f /q "%VIMINSTALL%\_gvimrc"
if exist "%VIMINSTALL%\.vimrc"                   del /f /q "%VIMINSTALL%\.vimrc"
if exist "%VIMINSTALL%\_vimrc"                   del /f /q "%VIMINSTALL%\_vimrc"
if exist "%VIMINSTALL%\vimfiles"                 rd /q     "%VIMINSTALL%\vimfiles"

if exist "%USERPROFILE%\.gvimrc"                  del /f /q "%USERPROFILE%\.gvimrc"
if exist "%USERPROFILE%\_gvimrc"                  del /f /q "%USERPROFILE%\_gvimrc"
if exist "%USERPROFILE%\.vimrc"                   del /f /q "%USERPROFILE%\.vimrc"
if exist "%USERPROFILE%\_vimrc"                   del /f /q "%USERPROFILE%\_vimrc"
if exist "%USERPROFILE%\.viminfo"                 del /f /q "%USERPROFILE%\.viminfo"
if exist "%USERPROFILE%\_viminfo"                 del /f /q "%USERPROFILE%\_viminfo"
if exist "%USERPROFILE%\vimfiles"                 rd /q     "%USERPROFILE%\vimfiles"

@echo Creating links...
if exist "%VIMCONFIG%\_gvimrc"  mklink    "%CYGWINPATH%\home\%USERNAME%\.gvimrc"  "%VIMCONFIG%\_gvimrc"
if exist "%VIMCONFIG%\_vimrc"   mklink    "%CYGWINPATH%\home\%USERNAME%\.vimrc"   "%VIMCONFIG%\_vimrc"
if exist "%VIMCONFIG%\_viminfo" mklink /h "%CYGWINPATH%\home\%USERNAME%\.viminfo" "%VIMCONFIG%\_viminfo"
if exist "%VIMCONFIG%\vimfiles" mklink /d "%CYGWINPATH%\home\%USERNAME%\.vim"     "%VIMCONFIG%\vimfiles"

if exist "%VIMCONFIG%\_gvimrc"  mklink    "%VIMINSTALL%\.gvimrc"  "%VIMCONFIG%\_gvimrc"
if exist "%VIMCONFIG%\_gvimrc"  mklink    "%VIMINSTALL%\_gvimrc"  "%VIMCONFIG%\_gvimrc"
if exist "%VIMCONFIG%\_vimrc"   mklink    "%VIMINSTALL%\.vimrc"   "%VIMCONFIG%\_vimrc"
if exist "%VIMCONFIG%\_vimrc"   mklink    "%VIMINSTALL%\_vimrc"   "%VIMCONFIG%\_vimrc"
if exist "%VIMCONFIG%\vimfiles" mklink /d "%VIMINSTALL%\vimfiles" "%VIMCONFIG%\vimfiles"

if exist "%VIMCONFIG%\_gvimrc"  mklink    "%USERPROFILE%\_gvimrc"  "%VIMCONFIG%\_gvimrc"
if exist "%VIMCONFIG%\_vimrc"   mklink    "%USERPROFILE%\_vimrc"   "%VIMCONFIG%\_vimrc"
if exist "%VIMCONFIG%\_viminfo" mklink /h "%USERPROFILE%\_viminfo" "%VIMCONFIG%\_viminfo"
if exist "%VIMCONFIG%\vimfiles" mklink /d "%USERPROFILE%\vimfiles" "%VIMCONFIG%\vimfiles"

endlocal
