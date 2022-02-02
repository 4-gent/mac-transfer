@echo off
REM File Name: pkgInstaller.bat

REM This file downloads the packages needed for programming, scripting, and installing any relevant software...

REM --------------------------------
REM Initialization
:initialization
echo --------------------------------
echo File Name: pkgInstaller.bat
echo --------------------------------
echo This file downloads necessary software and packages for programming, scripting, etc.
timeout 3
goto homebrew
REM --------------------------------
REM Homebrew Install
:homebrew
echo Installing homebrew (Programming)
echo Note: This is mostly meant for Linux and Mac
timeout 3
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
REM --------------------------------
REM vcpkg install
:vcpkg
git clone https://github.com/Microsoft/vcpkg.git

REM Verify if pcpkg is installed
$software = "Homebrew 2.2.9";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

If(-Not $installed) {
	Write-Host "'$software' NOT is installed.";
} else {
	Write-Host "'$software' is installed."
    cd vcpkg
    .\bootstrap-vcpkg.bat
    timeout 600
    .\vcpkg integrate install
}

REM Visual Studio Code Download
$url = https://code.visualstudio.com/docs/?dv=win32user
$output = "$PSScriptRoot\win32user"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
$wc.DownloadFileAsync($url, $output)