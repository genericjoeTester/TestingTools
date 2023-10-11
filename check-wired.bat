@echo off

echo Start Collecting Information...
cd /d %~dp0

REM Read Hostname and Create Directory

for /f "delims=" %%i in ('hostname') do set HOSTNAME=%%i
md %HOSTNAME%

REM Test-Connectivity get source IP and test connection to other host
arp -a >> %HOSTNAME%\out_arp.txt
ipconfig /all >> %HOSTNAME%\ipconfig.txt
powershell.exe tnc 10.207.35.162 -Port 9443 >> %HOSTNAME%\out_testconnection-wired.txt
powershell.exe tnc 10.207.35.160 -Port 9443 >> %HOSTNAME%\out_testconnection-wired.txt

powershell.exe tnc 10.200.14.200 -Port 443 >> %HOSTNAME%\out_testconnection-wired.txt
powershell.exe tnc 10.207.35.134 -Port 443 >> %HOSTNAME%\out_testconnection-wired.txt
powershell.exe tnc 10.207.35.103 -Port 443 >> %HOSTNAME%\out_testconnection-wired.txt

powershell.exe tnc 10.207.35.141 -Port 4119 >> %HOSTNAME%\out_testconnection-wired.txt


pause

@echo on