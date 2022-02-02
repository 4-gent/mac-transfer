Title WindowsScript

net user guest /active:no

netsh advfirewall set allprofiles state on

REM Registry key to enable updates
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f

pause
