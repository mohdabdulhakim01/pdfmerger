@echo off
mode 80,20
color b0
rem PDF Merger Script. Author : Mohd Abdul Hakim ,Bahagian Pengurusan Psikologi
set "currPath=%cd%"
set "sourcePath=%currPath%\senarai-dokumen"
set "outputPath=%currPath%\output"
for /F "tokens=1" %%a in ('dir "%sourcePath%\*.pdf" ^| findstr "File(s)"') do @set count=%%a
title PDF Merger
echo.          ______ ______ ______  ___  ___ _____ ______  _____  _____ ______ 
echo.          ^| ___ \^|  _  \^|  ___^| ^|  \/  ^|^|  ___^|^| ___ \^|  __ \^|  ___^|^| ___ \
echo.          ^| ^|_/ /^| ^| ^| ^|^| ^|_    ^| .  . ^|^| ^|__  ^| ^|_/ /^| ^|  \/^| ^|__  ^| ^|_/ /
echo.          ^|  __/ ^| ^| ^| ^|^|  _^|   ^| ^|\/^| ^|^|  __^| ^|    / ^| ^| __ ^|  __^| ^|    / 
echo.          ^| ^|    ^| ^|/ / ^| ^|     ^| ^|  ^| ^|^| ^|___ ^| ^|\ \ ^| ^|_\ \^| ^|___ ^| ^|\ \ 
echo.          \_^|    ^|___/  \_^|     \_^|  ^|_/\____/ \_^| \_^| \____/\____/ \_^| \_^|
echo.                                                                           
echo.                                                                                                                                          
echo.    PDF Merger                                          (%count%) dokumen dikesan.
echo.
set /p "ask=Gabungkan Sekarang [Y/N] ? "
if "%ask%" == "y"  goto :merge
if "%ask%" == "Y"  goto :merge
goto :end

:merge
del /F /Q "%outputPath%\selesai.pdf" 2>nul
call pdftkcli.exe "%sourcePath%\*.pdf" output "%outputPath%\selesai.pdf"
call explorer "%outputPath%"
echo.
echo.                  --------- GABUNGAN SELESAI ! ---------
echo.
pause
:end