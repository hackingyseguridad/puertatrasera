@ECHO OFF
ECHO Cliente Telenet desde CMD de Windows
ECHO Uso: telnetcliente.bat IP
ECHO Requiere tener instalado en el PC, ncat incluido en Zenmap https://nmap.org/download.html
ncat -vv %1 2323
