@echo off
echo Administrative rights status:
net sessions
if %errorlevel%==0 (
echo -Admin enabled-
) else (
echo disabled - Run again with Administrative rights
pause
exit
)
:MENU
echo Select task:
echo 1. Install tools
echo 2. Find Files
echo 3. System Integrity Scan
echo 4. Auto Setting Change -not all can be automated-
echo 5. Ntrights - edit user privileges
echo 6. Manage Users
echo 7. Set Password - BingBong13
echo 8. Enable Remote Desktop
echo 9.

CHOICE /C 123456789 /M "Enter Task: "
if ERRORLEVEL 9 goto Nine
if ERRORLEVEL 8 goto Eight
if ERRORLEVEL 7 goto Seven
if ERRORLEVEL 6 goto Six
if ERRORLEVEL 5 goto Five
if ERRORLEVEL 4 goto Four
if ERRORLEVEL 3 goto Three
if ERRORLEVEL 2 goto Two
if ERRORLEVEL 1 goto One
:One
rem echo "INSTALLING SOFTWARE"
REM Installs Chocolatey
rem @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
rem choco upgrade chocolatey
REM installs software
rem choco install firefox -y
rem choco install malwarebytes -y
rem choco install revo-uninstaller  -y
rem choco install avgantivirusfree  -y
rem echo INSTALLED FIREFOX, MALWAREBYTES, REVO-UNINSTALLER, AVG ANTI-VIRUS
rem cls
rem PAUSE
rem goto MENU
:Two
REM Find Files
@echo off
color 0f
cls
echo Flashing Disk to .flashed Files to reference....
dir /b /s "C:\Program Files\" > programfiles.flashed
dir /b /s "C:\Program Files (x86)\" >> programfiles.flashed
echo Program Files flashed
dir /b /s "C:\Users\" > users.flashed
dir /b /s "C:\Documents and Settings" >> users.flashed
echo User profiles flashed
dir /b /s "C:\" > c.flashed
echo C:\ Flashed
pause
echo Finding media files in C:\Users and/or C:\Documents and Settings
findstr .mp3 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp3 > media_audio
findstr .ac3 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.ac3 >> media_audio
findstr .aac users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.aac >> media_audio
findstr .aiff users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.aiff >> media_audio
findstr .flac users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.flac >> media_audio
findstr .m4a users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m4a >> media_audio
findstr .m4p users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m4p >> media_audio
findstr .midi users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.midi >> media_audio
findstr .mp2 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp2 >> media_audio
findstr .m3u users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m3u >> media_audio
findstr .ogg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.ogg >> media_audio
findstr .vqf users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.vqf >> media_audio
findstr .wav users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.wav >> media_audio
findstr .wma users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.wma >> media_video
findstr .mp4 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp4 >> media_video
findstr .avi users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.avi >> media_video
findstr .mpeg4 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ .mpeg4 >> media_video
REM BREAKLINE
findstr .gif users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.gif >> media_pics
findstr .png users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.png >> media_pics
findstr .bmp users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.bmp >> media_pics
findstr .jpg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ .jpg >> media_pics
findstr .jpeg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ .jpeg >> media_pics
C:\WINDOWS\system32\notepad.exe media_video
C:\WINDOWS\system32\notepad.exe media_audio
C:\WINDOWS\system32\notepad.exe media_pics
echo Finding Hacking Software
findstr "Cain" programfiles.flashed
if %errorlevel%==0 (
echo Cain detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "nmap" programfiles.flashed
if %errorlevel%==0 (
echo Nmap detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "keylogger" programfiles.flashed
if %errorlevel%==0 (
echo Potential keylogger detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Armitage" programfiles.flashed
if %errorlevel%==0 (
echo Potential Armitage detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Metasploit" programfiles.flashed
if %errorlevel%==0 (
echo Potential Metasploit framework detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Shellter" programfiles.flashed
if %errorlevel%==0 (
echo Potential Shellter detected. Please take note, then press any key.
pause >NUL
)
cls
goto MENU
:Three
REM STARTs SYSTEM INTEGRITY SCAN
echo "STARTING SYSTEM INTERGRITY SCAN"
echo "If it fails make sure you can access Sfc.exe"
Sfc.exe /scannow
cls
goto MENU
:Four
echo "TURNING THINGS ON AND OFF AND BEEP BOOP BING BONG"
REM Turn on User Account Control
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
REM Turn off Remote Desktop Protocol
REM Remote Desktop
sc stop "TermService"
sc config "TermService" start= disabled
sc stop "SessionEnv"
sc config "SessionEnv" start= disabled
sc stop "UmRdpService"
sc config "UmRdpService" start= disabled
sc stop "RemoteRegistry"
sc config "RemoteRegistry" start= disabled 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
REM Failsafe
if %errorlevel%==1 netsh advfirewall firewall set service type = remotedesktop mode = disable
echo Cleaning out the DNS cache
ipconfig /flushdns
echo Writing over the hosts file...
attrib -r -s C:\WINDOWS\system32\drivers\etc\hosts
echo > C:\Windows\System32\drivers\etc\hosts
attrib +r +s C:\WINDOWS\system32\drivers\etc\hosts
if %errorlevel%==1 echo There was an error in writing to the hosts file (not running this as Admin probably)
REM Turn on Firewall
netsh advfirewall set allprofiles state on
echo Fire wall enabled
REM Services
echo Showing you the services...
net start
echo Now writing services to a file and searching for vulnerable services...
net start > servicesstarted.txt
echo This is only common services, not nessecarily going to locate 100%
REM looks to see if remote registry is on
net start | findstr Remote Registry
if %errorlevel%==0 (
	echo Remote Registry is running!
	echo Attempting to stop...
	net stop RemoteRegistry
	sc config RemoteRegistry start=disabled
	if %errorlevel%==1 echo Stop failed... sorry...
) else ( 
	echo Remote Registry is already indicating stopped.
)
REM Remove all saved credentials
cmdkey.exe /list > "%TEMP%\List.txt"
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
del "%TEMP%\*.*" /s /f /q
set SRVC_LIST=(RemoteAccess Telephony tlntsvr p2pimsvc simptcp fax msftpsvc)
	for %%i in %HITHERE% do net stop %%i
	for %%i in %HITHERE% sc config %%i start= disabled
netsh advfirewall firewall set rule name="Remote Assistance (DCOM-In)" new enable=no >NUL
netsh advfirewall firewall set rule name="Remote Assistance (PNRP-In)" new enable=no >NUL
netsh advfirewall firewall set rule name="Remote Assistance (RA Server TCP-In)" new enable=no >NUL
netsh advfirewall firewall set rule name="Remote Assistance (SSDP TCP-In)" new enable=no >NUL
netsh advfirewall firewall set rule name="Remote Assistance (SSDP UDP-In)" new enable=no >NUL
netsh advfirewall firewall set rule name="Remote Assistance (TCP-In)" new enable=no >NUL
netsh advfirewall firewall set rule name="Telnet Server" new enable=no >NUL
netsh advfirewall firewall set rule name="netcat" new enable=no >NUL
REM Disabling Weak Services
echo "DISABLING WEAK SERVICES"
dism /online /disable-feature /featurename:IIS-WebServerRole >NUL
dism /online /disable-feature /featurename:IIS-WebServer >NUL
dism /online /disable-feature /featurename:IIS-CommonHttpFeatures >NUL
dism /online /disable-feature /featurename:IIS-HttpErrors >NUL
dism /online /disable-feature /featurename:IIS-HttpRedirect >NUL
dism /online /disable-feature /featurename:IIS-ApplicationDevelopment >NUL
dism /online /disable-feature /featurename:IIS-NetFxExtensibility >NUL
dism /online /disable-feature /featurename:IIS-NetFxExtensibility45 >NUL
dism /online /disable-feature /featurename:IIS-HealthAndDiagnostics >NUL
dism /online /disable-feature /featurename:IIS-HttpLogging >NUL
dism /online /disable-feature /featurename:IIS-LoggingLibraries >NUL
dism /online /disable-feature /featurename:IIS-RequestMonitor >NUL
dism /online /disable-feature /featurename:IIS-HttpTracing >NUL
dism /online /disable-feature /featurename:IIS-Security >NUL
dism /online /disable-feature /featurename:IIS-URLAuthorization >NUL
dism /online /disable-feature /featurename:IIS-RequestFiltering >NUL
dism /online /disable-feature /featurename:IIS-IPSecurity >NUL
dism /online /disable-feature /featurename:IIS-Performance >NUL
dism /online /disable-feature /featurename:IIS-HttpCompressionDynamic >NUL
dism /online /disable-feature /featurename:IIS-WebServerManagementTools >NUL
dism /online /disable-feature /featurename:IIS-ManagementScriptingTools >NUL
dism /online /disable-feature /featurename:IIS-IIS6ManagementCompatibility >NUL
dism /online /disable-feature /featurename:IIS-Metabase >NUL
dism /online /disable-feature /featurename:IIS-HostableWebCore >NUL
dism /online /disable-feature /featurename:IIS-StaticContent >NUL
dism /online /disable-feature /featurename:IIS-DefaultDocument >NUL
dism /online /disable-feature /featurename:IIS-DirectoryBrowsing >NUL
dism /online /disable-feature /featurename:IIS-WebDAV >NUL
dism /online /disable-feature /featurename:IIS-WebSockets >NUL
dism /online /disable-feature /featurename:IIS-ApplicationInit >NUL
dism /online /disable-feature /featurename:IIS-ASPNET >NUL
dism /online /disable-feature /featurename:IIS-ASPNET45 >NUL
dism /online /disable-feature /featurename:IIS-ASP >NUL
dism /online /disable-feature /featurename:IIS-CGI >NUL
dism /online /disable-feature /featurename:IIS-ISAPIExtensions >NUL
dism /online /disable-feature /featurename:IIS-ISAPIFilter >NUL
dism /online /disable-feature /featurename:IIS-ServerSideIncludes >NUL
dism /online /disable-feature /featurename:IIS-CustomLogging >NUL
dism /online /disable-feature /featurename:IIS-BasicAuthentication >NUL
dism /online /disable-feature /featurename:IIS-HttpCompressionStatic >NUL
dism /online /disable-feature /featurename:IIS-ManagementConsole >NUL
dism /online /disable-feature /featurename:IIS-ManagementService >NUL
dism /online /disable-feature /featurename:IIS-WMICompatibility >NUL
dism /online /disable-feature /featurename:IIS-LegacyScripts >NUL
dism /online /disable-feature /featurename:IIS-LegacySnapIn >NUL
dism /online /disable-feature /featurename:IIS-FTPServer >NUL
dism /online /disable-feature /featurename:IIS-FTPSvc >NUL
dism /online /disable-feature /featurename:IIS-FTPExtensibility >NUL
dism /online /disable-feature /featurename:TFTP >NUL
dism /online /disable-feature /featurename:TelnetClient >NUL
dism /online /disable-feature /featurename:TelnetServer >NUL
sc stop"TlntSvr"
sc config "TlntSvr" start= disabled 
reg ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v DoNotTrack /t REG_DWORD /d 1 /f
reg ADD "HKCU\Software\Microsoft\Internet Explorer\Download" /v RunInvalidSignatures /t REG_DWORD /d 1 /f
reg ADD "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v LOCALMACHINE_CD_UNLOCK /t REG_DWORD /d 1 /t
reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v WarnonBadCertRecving /t REG_DWORD /d /1 /f
reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v WarnOnPostRedirect /t REG_DWORD /d 1 /f
reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v WarnonZoneCrossing /t REG_DWORD /d 1 /f
reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v DisablePasswordCaching /t REG_DWORD /d 1 /f 
reg ADD HKCU\SYSTEM\CurrentControlSet\Services\CDROM /v AutoRun /t REG_DWORD /d 1 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\CrashControl /v CrashDumpEnabled /t REG_DWORD /d 0 /f
Rem Windows Auto Updates
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DisableWindowsUpdateAccess /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v ElevateNonAdmins /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWindowsUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Internet Communication Management\Internet Communication" /v DisableWindowsUpdateAccess /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate /v DisableWindowsUpdateAccess /t REG_DWORD /d 0 /f
REM Restrict CD ROM drive
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AllocateCDRoms /t REG_DWORD /d 1 /f
REM Disable Automatic Admin logon
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_DWORD /d 0 /f
REM Logon message text
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v LegalNoticeText /t REG_SZ /d "Lol noobz pl0x don't hax, thx bae"
REM Logon message title bar
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v LegalNoticeCaption /t REG_SZ /d "Dnt hax me"
REM Clear page file before shutdown
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f
REM Disallow remote access to floppie disks
reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AllocateFloppies /t REG_DWORD /d 1 /f
REM Prevent print driver installs 
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v AddPrinterDrivers /t REG_DWORD /d 1 /f
REM Limit local account use of blank passwords to console
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f
REM Auditing access of Global System Objects
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v auditbaseobjects /t REG_DWORD /d 1 /f
REM Auditing Backup and Restore
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v fullprivilegeauditing /t REG_DWORD /d 1 /f
REM Do not display last user on logon
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f
REM UAC setting (Prompt on Secure Desktop)
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 1 /f
REM Enable Installer Detection
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableInstallerDetection /t REG_DWORD /d 1 /f
REM Undock without logon
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v undockwithoutlogon /t REG_DWORD /d 0 /f
REM Maximum Machine Password Age
reg ADD HKLM\SYSTEM\CurrentControlSet\services\Netlogon\Parameters /v MaximumPasswordAge /t REG_DWORD /d 15 /f
REM Disable machine account password changes
reg ADD HKLM\SYSTEM\CurrentControlSet\services\Netlogon\Parameters /v DisablePasswordChange /t REG_DWORD /d 1 /f
REM Require Strong Session Key
reg ADD HKLM\SYSTEM\CurrentControlSet\services\Netlogon\Parameters /v RequireStrongKey /t REG_DWORD /d 1 /f
REM Require Sign/Seal
reg ADD HKLM\SYSTEM\CurrentControlSet\services\Netlogon\Parameters /v RequireSignOrSeal /t REG_DWORD /d 1 /f
REM Sign Channel
reg ADD HKLM\SYSTEM\CurrentControlSet\services\Netlogon\Parameters /v SignSecureChannel /t REG_DWORD /d 1 /f
REM Seal Channel
reg ADD HKLM\SYSTEM\CurrentControlSet\services\Netlogon\Parameters /v SealSecureChannel /t REG_DWORD /d 1 /f
REM Don't disable CTRL+ALT+DEL
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCAD /t REG_DWORD /d 0 /f 
REM Restrict Anonymous Enumeration #1
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymous /t REG_DWORD /d 1 /f 
REM Restrict Anonymous Enumeration #2
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymoussam /t REG_DWORD /d 1 /f 
REM Idle Time Limit - 45 mins
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v autodisconnect /t REG_DWORD /d 45 /f 
REM Require Security Signature - Disabled pursuant to checklist
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v enablesecuritysignature /t REG_DWORD /d 0 /f 
REM Enable Security Signature - Disabled pursuant to checklist
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v requiresecuritysignature /t REG_DWORD /d 0 /f 
REM Disable Domain Credential Storage
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v disabledomaincreds /t REG_DWORD /d 1 /f 
REM Don't Give Everyone Permissions
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v everyoneincludesanonymous /t REG_DWORD /d 0 /f 
REM SMB Passwords unencrypted to third party disabled
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanWorkstation\Parameters /v EnablePlainTextPassword /t REG_DWORD /d 0 /f
REM Clear Null Session Pipes
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v NullSessionPipes /t REG_MULTI_SZ /d "" /f
REM Clear Remote Registry Paths
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedExactPaths /v Machine /t REG_MULTI_SZ /d "" /f
REM Clear remote registry paths and sub-paths
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths /v Machine /t REG_MULTI_SZ /d "" /f
REM Restict anonymous access to named pipes and shares
reg ADD HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters /v NullSessionShares /t REG_MULTI_SZ /d "" /f
REM Allow to use Machine ID for NTLM
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v UseMachineId /t REG_DWORD /d 0 /f
REM Enable smart screen for IE8
reg ADD "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v EnabledV8 /t REG_DWORD /d 1 /f
::Enable smart screen for IE9 and up
reg ADD "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 1 /f
::Show hidden files
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 1 /f
::Disable sticky keys
reg ADD "HKU\.DEFAULT\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f
::Show super hidden files
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowSuperHidden /t REG_DWORD /d 1 /f
REM Disable guest accoount
net user guest /active:no
REM Power Settings
powercfg -SETDCVALUEINDEX SCHEME_BALANCED SUB_NONE CONSOLELOCK 1
powercfg -SETDCVALUEINDEX SCHEME_MIN SUB_NONE CONSOLELOCK 1
powercfg -SETDCVALUEINDEX SCHEME_MAX SUB_NONE CONSOLELOCK 1
echo "AUDIT POLICIES CHANGING to SUCCESS/FAILURE for ALL catagories"
REM Setting Auditing Success and Failure
auditpol /set /category:* /success:enable
auditpol /set /category:* /failure:enable
echo Auditing set to SUCCESS and FAILURE
echo "PASSWORD POLICIES CHANGED"
REM Acc lockout:5, Min Pass Length:8 digits, Min Pass Age:10 days, Max Pass Age:30 days, Pass history:5 days
net accounts /lockoutthreshold:5 /minpwlen:8 /minpwage:10 /maxpwage:30 /uniquepw:5
echo "CURRENT PASSWORD POLICY"
echo MANUALLY Set password policy: Password policy must meet complexity to enable
echo MANUALLY Set password policy: Store passwords using reversible encryption to disabled
echo Secpol.msc will be started for manual process
start secpol.msc /wait
PAUSE
net accounts
goto MENU
:Five
echo Installing ntrights.exe to C:\Windows\System32
copy %path%resources\ntrights.exe C:\Windows\System32
if exist C:\Windows\System32\ntrights.exe (
	echo Installation succeeded, managing user rights..
	set remove=("Backup Operators" "Everyone" "Power Users" "Users" "NETWORK SERVICE" "LOCAL SERVICE" "Remote Desktop User" "ANONOYMOUS LOGON" "Guest" "Performance Log Users")
	for %%a in (%remove%) do (
			ntrights -U %%a -R SeNetworkLogonRight 
			ntrights -U %%a -R SeIncreaseQuotaPrivilege
			ntrights -U %%a -R SeInteractiveLogonRight
			ntrights -U %%a -R SeRemoteInteractiveLogonRight
			ntrights -U %%a -R SeSystemtimePrivilege
			ntrights -U %%a +R SeDenyNetworkLogonRight
			ntrights -U %%a +R SeDenyRemoteInteractiveLogonRight
			ntrights -U %%a -R SeProfileSingleProcessPrivilege
			ntrights -U %%a -R SeBatchLogonRight
			ntrights -U %%a -R SeUndockPrivilege
			ntrights -U %%a -R SeRestorePrivilege
			ntrights -U %%a -R SeShutdownPrivilege
		)
		ntrights -U "Administrators" -R SeImpersonatePrivilege
		ntrights -U "Administrator" -R SeImpersonatePrivilege
		ntrights -U "SERVICE" -R SeImpersonatePrivilege
		ntrights -U "LOCAL SERVICE" +R SeImpersonatePrivilege
		ntrights -U "NETWORK SERVICE" +R SeImpersonatePrivilege
		ntrights -U "Administrators" +R SeMachineAccountPrivilege
		ntrights -U "Administrator" +R SeMachineAccountPrivilege
		ntrights -U "Administrators" -R SeIncreaseQuotaPrivilege
		ntrights -U "Administrator" -R SeIncreaseQuotaPrivilege
		ntrights -U "Administrators" -R SeDebugPrivilege
		ntrights -U "Administrator" -R SeDebugPrivilege
		ntrights -U "Administrators" +R SeLockMemoryPrivilege
		ntrights -U "Administrator" +R SeLockMemoryPrivilege
		ntrights -U "Administrators" -R SeBatchLogonRight
		ntrights -U "Administrator" -R SeBatchLogonRight
		echo Managed User Rights
)
goto Menu
:Six
echo Manage users
start %path%output\users.txt
start C:\Windows\System32\lusrmgr.msc /wait
echo Managed users
goto Menu
:Seven
echo Making passwords expire, and setting password to: BingBong13 
echo Please change the MAIN account password after script
for /f "tokens=*" %%a in ('type %path%resources\users.txt') do (
	net user "%%a" "BingBong13"
	C:\Windows\System32\wbem\wmic UserAccount where Name="%%a" set PasswordExpires=True
)
echo Made passwords expire, and set passwords
goto Menu
:Eight
set /p rdpChk="Enable remote desktop (y/n)"
if %rdpChk%==y (
	echo Enabling remote desktop...
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 1 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 1 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 1 /f
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
	netsh advfirewall firewall set rule group="remote desktop" new enable=yes
	echo Please select "Allow connections only from computers running Remote Desktop with Network Level Authentication (more secure)"
	start SystemPropertiesRemote.exe /wait
	echo Enabled remote desktop
	goto:EOF
)
if %rdpChk%==n (
	echo Disabling remote desktop...
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 0 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
	netsh advfirewall firewall set rule group="remote desktop" new enable=no
	echo Disabled remote desktop
	goto Menu
)
echo Invalid input %rdpChk%
goto rdp
pause