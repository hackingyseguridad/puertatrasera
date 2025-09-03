## Puertas traseras en routers

puertas traseras: servicios encubiertos que se activan bajo ciertas ssecuencias, servicios oficiales del equipo:  SSH, Telnet o TR-069, Hardware (Nivel de Chip)

## Huawei B315s-22.- Router Huawei Home Gateway WiFi 4G/LTE

Puerta trasera ("backdoor") oculto en el software de equipos Huawei; puerto "disparador" UDP 9537. este es el puerto secreto que activaba la puerta trasera, por TELNET. El puerto telnet Backdoor solo se activaba si el equipo de Huawei recibia un paquete al puerto 9537/UDP.- Esto activaba  como un interruptor el servicio Telnet oculto en el equipo que inicia la escucha en el puerto telnet 23/tcp,  con credenciales por defecto o hardcodeada -  Huawei argumentó que este acceso era parte de una funcionalidad de diagnóstico para mantenimiento y no una puerta trasera malintencionada, pero Vodafone y los organismos de seguridad consideraron que su naturaleza oculta y no documentada representaba un grave riesgo de seguridad.

https://www.bloomberg.com/news/articles/2019-04-30/vodafone-found-hidden-backdoors-in-huawei-equipment
https://www.theguardian.com/technology/2019/apr/30/alleged-huawei-router-backdoor-is-standard-networking-tool-says-firm
https://www.theregister.com/2019/04/30/huawei_enterprise_router_backdoor_is_telnet/
https://www.exploit-db.com/exploits/45971
https://www.4gltemall.com/blog/huawei-b315s-22-4g-lte-wifi-router-review/
https://comunidad.movistar.es/t5/Soporte-M%C3%B3vil/Configuraci%C3%B3n-de-router-B315s-22-con-tarjeta-SIM/td-p/4128607
https://wwulbou.medium.com/huawei-hg532d-rce-exploit-ef2639db25b4

## Huawei,  routers series: HGxxx, EchoLife

Se identifico  en el puerto 37215/tcp servicio que permitía el acceso no autenticado ( interface WAN ) o con credenciales por defecto ocultas exponiendo una shell de administración. - también, se argumentó que era para el mantenimiento remoto del ISP.

El investigador de seguridad Felix "FX" Lindner y su equipo de Recurity Labs descubrieron esta puerta trasera en muchos routers Huawei, incluidos los modelos EchoLife.
El funcionamiento era el siguiente:
Un atacante se conectaba al puerto 37215 del router desde internet o desde la red local.
El servicio en este puerto pedía una contraseña.
Los investigadores descubrieron que si se enviaba un hash de contraseña específico y predefinido (0x2378216f4f3d5e316c2e7a22432d4851), el sistema lo aceptaba.
Tras la aceptación, el atacante obtenía acceso a una terminal de root (shell) en el dispositivo. Esto es el nivel de acceso más alto posible, equivalente a un control total absoluto.
Esto eludía por completo la página de inicio de sesión web normal y todas las medidas de seguridad.

https://e.huawei.com/es/products/optical-terminal/echolife-eg8145v5

Huawei HG8245, firm:V1R006C00S100, 
Fecha de publicación:	09/12/2013
Severidad:	Muy alta
Solución:	Deshabilitar acceso WAN-side de HTTP y Telnet.
No es posible cambiar la contraseña de la cuenta de administración web: admin
La puerta trasera consiste en una cuenta de administración web por defecto a la cual no se le puede cambiar la contraseña. La cuenta de administración web por defecto en esta versión de software es:
admin:*6P0N4dm1nP4SS*
Existe otra cuenta de administración telnet por defecto:
root:admin

## Backdoors en Routers Empresariales Huawei (Series AR y NE)

Modelo	Versiones Vulnerables de Firmware	Puerto Backdoor

AR120-S	V200R005C10 y anteriores	37215, 2000

AR150-S	V200R006C10 y anteriores	37215, 2000

AR160-S	V200R005C10 y anteriores	37215, 3000

NE40E	Versiones pre-2016	37215, SSH

Protocolos de gestión propietarios: Huawei  protocolos internos (ej: NetConf sobre SSH), credenciales triviales root/admin123.puertos tcp: 820, 22

https://e.huawei.com/mx/products/routers/ne40e 

##  Chips de videovigilancia HiSilicon, puerta trasera

Puerta trasera (backdoor) en la cámara Huawei HiWatch DS-2CD9530FWD-I8 (y otros modelos)
Huawei lanzó un parche de firmware para "solucionar" el problema. La "solución" consistió en deshabilitar el puerto 9530 por defecto, pero sin explicar satisfactoriamente por qué existía en primer lugar o por qué permitía el acceso no autenticado al video.

https://www.zdnet.com/article/researcher-backdoor-mechanism-still-active-in-many-iot-products/
https://www.huawei.com/en/psirt/security-notices/2020/huawei-sn-20200205-01-hisilicon-en
https://ipvm.com/reports/backdoor-9530

## Técnicas de exfiltración de datos

Si un dispositivo está comprometido, el siguiente paso es enviar la información robada sin ser detectado. Las técnicas teóricas incluyen:

Tunelización DNS: Codificar los datos robados dentro de consultas DNS normales. Como el DNS es vital para Internet, rara vez se bloquea o inspecciona en profundidad, lo que lo convierte en un canal encubierto perfecto.

Camuflaje con Tráfico Legítimo: Enviar pequeños paquetes de datos ocultos dentro del tráfico web normal y cifrado (HTTPS) hacia un servidor malicioso que parece legítimo. Esto parece actividad normal del usuario.

Almacenamiento y Envío Diferido: En lugar de enviar datos inmediatamente, se almacenan en una partición oculta y se envían más tarde durante períodos de alto tráfico o cuando el dispositivo está inactivo, para pasar desapercibidos.

Uso de Puertos Comunes: Usar puertos estándar como el HTTP (80), HTTPS (443) o DNS (53) para la exfiltración, ya que bloquearlos rompería la funcionalidad básica de Internet. La clave no es el puerto, sino el contenido malicioso dentro del tráfico permitido.

## Abuso de funciones Legítimas de mantenimiento

El mayor riesgo potencial es el mal uso de características necesarias para el funcionamiento de la red.

Proceso de Actualizaciones (OTA): El mecanismo para enviar actualizaciones de firmware es vital. Un actor malintencionado con control sobre este sistema podría distribuir una actualización maliciosa disfrazada de parche de seguridad, instalando spyware a escala masiva con el "permiso" del sistema.

Acceso Remoto para Soporte: Los operadores de red necesitan herramientas de acceso remoto para el diagnóstico y mantenimiento. Si estas herramientas tienen vulnerabilidades ocultas o funcionalidades secretas, podrían ser explotadas.

# Vulnerabilidades CVE, 

Otra forma de tener acceso a los equipos, dificil de relaccionar con el favbircante y evidenciar, serian las vulnerabilidades conocidas, CVE de OpenSSH, Telnet, ...

Otra forma seria, codigo en la programación de estos equipos, que permitiria explotar fallos y obtener acceso, exfiltración de datos

https://www.gov.uk/government/publications/huawei-cyber-security-evaluation-centre-hcsec-oversight-board-annual-report-2021 





http://www.hackingyseguridad.com/
