@echo off
set PFAD1=%cd%
cd..
cd Temperatur
set PFAD2=%cd%
cd %PFAD1%
@echo on

Digitemp.exe -s6 -a -i -l"%PFAD2%\log.txt" -o"%%d.%%m.%%y %%H:%%M:%%S;%%s;%%.1C"
