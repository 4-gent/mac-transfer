@echo off
REM 4gentTools.bat

REM --------------------------
REM Initialization
:Initialization
echo -------------- 4gentTools.bat --------------
echo .
echo .
echo .
echo .
echo .
echo --------------------------------------------
echo Tool Installation (a)
echo Sniffing (b)
echo --------------------------------------------

REM User Input
set /p input=:

REM Function Directory
if /i %input%==a(
    goto tools
)
if /i %input%==b(
    goto sniff
)
REM --------------------------
REM Tool Installation
:tools
REM Homebrew Install
echo Installing Homebrew...
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo Homebrew Installed

REM Visual Studio Code Install
echo Installing Visual Studio Code...
brew cask insatll visual-studio-Code
echo Visual Studio Code Installed

REM Wireshark Install
echo Installing Wireshark...
brew cask install Wireshark
echo Wireshark Installed

REM Prereq Packages Install
echo Installing Packages...
brew install autoconf
brew install automake
brew install libtool
brew install openssl
brew install shtool
brew install pkg-config
brew install pcre
echo Packages Installed

REM --------------------------
REM Sniffer
:sniff

REM --------------------------