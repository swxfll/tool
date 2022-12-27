@echo off
rem Automates instructions from google found here https://support.google.com/chrome/a/answer/9844476?hl=en
rem Removes the 'Managed by your organization' from Google Chrome and prevents persistence
echo Make sure you have backed up your registry. Ready to go ahead?
pause
cls
echo Working...
echo Exiting Chrome (if running)
taskkill /f /im chrome.exe
if exist "C:\Program Files (x86)\Google\Policies" RMDIR /S /Q "C:\Program Files (x86)\Google\Policies"
reg delete HKEY_CURRENT_USER\SOFTWARE\Google\Chrome /f /va 
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Google\Chrome /f /va 
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome /f /va 
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Google\Update\ClientState\{430FD4D0-B729-4F61-AA34-91526481799D} /f /va 
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist /f
echo Stopping and Disabling Sound Research Service
sc stop SECOMNService
sc config SECOMNService start= disabled
echo Complete!
pause
