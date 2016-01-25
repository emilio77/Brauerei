@echo off
set PFAD1=%cd%
cd..
cd Temperatur
set PFAD2=%cd%
cd %PFAD1%

if "%1"=="" goto eingabe
set port=%1

goto ausgabe

:eingabe
set /p port="COM-Port eingeben: "
goto ausgabe

:ausgabe

@echo on

Digitemp.exe -s%port% -t0 -i -l"%PFAD2%\log.txt" -o"%%d.%%m.%%y %%H:%%M:%%S;%%.1C" -n5000 -d5
