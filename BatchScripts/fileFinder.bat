@echo off

REM --------------------------
REM File Name: fileFinder.bat
REM --------------------------
REM This file allows the user to search and delete any files

echo --------------------------
echo File Name: fileFinder.bat
echo --------------------------
echo This file allows the user to search and delete any files

timeout 5

REM User Startup
:initialization
echo ---------------------------
echo What would you like to do?
echo ---------------------------

set /p input="Delete Media Files (a) / Search for a file (b) / Uninstall Programs (c) / End Script (d)"

if %input%==a goto delete
if %input%==b goto search
if %input%==c goto uninstall
if %input%==d goto end

REM ----------------------------------------
REM This deletes media files
:delete
echo Deleting Media Files...
cd C:\Users\
del C:\Users\*.mp3
del C:\Users\*.mp4
del C:\Users\*.mov
del C:\Users\*.wav
del C:\Users\*.wmv
del C:\Users\*.amv
echo Media Files Deleted
goto initialization
REM ----------------------------------------
REM This searches for specific files
:search
echo Enter file name
set /p name=":"
REM grab the file path for the name and then give an option of what they'd like to do with it
echo Search Complete
REM ----------------------------------------
REM This reveals all available programs and asks which one would they like to uninstall
:uninstall
Get-WmiObject -Class Win32_Product | Select-Object -Property Name
echo Find the EXACT name of the program you want to uninstall
set /p uninstall="Name: "
$javaVer = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -match "" } |
            Select-Object -Property DisplayName, UninstallString

ForEach ($ver in $javaVer) {

    If ($ver.UninstallString) {

        $uninst = $ver.UninstallString
        & cmd /c $uninst /quiet /norestart
    }

}
REM give option to choose a file to delete
echo Program Sorting Complete
REM ----------------------------------------
REM This ends the Script
:end
echo Shutting Down...
timeout 3
pause
exit

REM Uninstall registry key
REM Reg Query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall