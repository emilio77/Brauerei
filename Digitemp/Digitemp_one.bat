@echo off
set PFAD1=%cd%
cd..
cd Temperatur
set PFAD2=%cd%
cd %PFAD1%
@echo on

Digitemp.exe -s7 -t0 -i -l"%PFAD2%\log.txt" -o"%%d.%%m.%%y %%H:%%M:%%S;%%.1C"

