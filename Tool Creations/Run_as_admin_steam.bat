@echo off
icacls "C:\Program Files (x86)\Common Files\Steam\steamservice.exe" /grant Everyone:F >nul 2>&1
exit