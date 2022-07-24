@echo off
tasklist /fi "pyhip.exe" |find ":" > nul
if errorlevel 1 taskkill /f /IM pyhip.exe
cd Backend
start /B pyhip/pyhip.exe -O gui 
for /l %%a in (1,1,2) do timeout 3600>nul
taskkill /f /IM pyhip.exe
exit