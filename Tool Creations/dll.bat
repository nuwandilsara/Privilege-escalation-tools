@echo off
setlocal

:: Local Desktop only (no OneDrive checks)
set "DESKTOP=%USERPROFILE%\Desktop"
set "DEST=%DESKTOP%\lab02"

:: Step 1 — create Desktop\lab02
mkdir "%DEST%" 2>nul
if not exist "%DEST%" (
  echo [!] Failed to create "%DEST%".
  exit /b 1
)

:: Step 2 — copy C:\Windows\System32\Dism.exe into lab02
set "SRC=%WINDIR%\System32\Dism.exe"
:: if you ever run 32-bit cmd on 64-bit Windows, System32 is redirected—use Sysnative
if not exist "%SRC%" if exist "%WINDIR%\Sysnative\Dism.exe" set "SRC=%WINDIR%\Sysnative\Dism.exe"

if not exist "%SRC%" (
  echo [!] DISM not found at "%WINDIR%\System32\Dism.exe".
  exit /b 2
)

copy /y "%SRC%" "%DEST%\" >nul
if errorlevel 1 (
  echo [!] Copy failed.
  exit /b 3
)

echo [+] Copied "%SRC%" -> "%DEST%"
endlocal
