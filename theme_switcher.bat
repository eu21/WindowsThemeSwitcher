@echo off

set KEY_NAME="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"

echo query is dark or not

FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY %KEY_NAME% /v AppsUseLightTheme`) DO (
set is_dark=%%A %%B
)

echo activate if yes and vice versa

if %is_dark% EQU 0x1 (
reg add %KEY_NAME% /v AppsUseLightTheme /t REG_DWORD /d 0 /f
) else (
reg add %KEY_NAME% /v AppsUseLightTheme /t REG_DWORD /d 1 /f
)
echo %is_dark%

cls

echo INFO: Go to taskmanager and restart Explorer.exe process.
echo ''
echo ''
echo ''
pause