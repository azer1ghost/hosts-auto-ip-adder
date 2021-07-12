@echo off

SET NEWHOST=10.10.11.8 managment

fsutil dirty query %SystemDrive% >nul || (
   PowerShell "Start-Process -FilePath '%0' -Verb RunAs"
   Exit
)

ECHO %NEWHOST% >>%WINDIR%\System32\drivers\etc\hosts

echo Successfully added IP Address to localhost.
ipconfig /flushdns
timeout /t 3 >>nul
exit