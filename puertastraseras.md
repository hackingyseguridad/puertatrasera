## Puertas traseras en routers


## Huawei B315s-22.- Router Huawei Home Gateway WiFi 4G/LTE

Puerta trasera ("backdoor") oculto en el software de equipos Huawei; puerto "disparador" UDP 9537. este es el puerto secreto que activaba la puerta trasera, por TELNET. El puerto telnet Backdoor solo se activaba si el equipo de Huawei recibia un paquete al puerto 9537/UDP.- Esto activaba  como un interruptor el servicio Telnet oculto en el equipo que inicia la escucha en el puerto telnet 23/tcp,  con credenciales por defecto o hardcodeada -  Huawei argumentó que este acceso era parte de una funcionalidad de diagnóstico para mantenimiento y no una puerta trasera malintencionada, pero Vodafone y los organismos de seguridad consideraron que su naturaleza oculta y no documentada representaba un grave riesgo de seguridad.

https://www.bloomberg.com/news/articles/2019-04-30/vodafone-found-hidden-backdoors-in-huawei-equipment
https://www.theguardian.com/technology/2019/apr/30/alleged-huawei-router-backdoor-is-standard-networking-tool-says-firm
https://www.theregister.com/2019/04/30/huawei_enterprise_router_backdoor_is_telnet/
https://www.exploit-db.com/exploits/45971
https://comunidad.movistar.es/t5/Soporte-M%C3%B3vil/Configuraci%C3%B3n-de-router-B315s-22-con-tarjeta-SIM/td-p/4128607

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

Protocolos de gestión propietarios: Huawei  protocolos internos (ej: NetConf sobre SSH), credenciales triviales root/admin123 . puertos tcp: 820, 22

##  Chips de videovigilancia HiSilicon, puerta trasera

Puerta trasera (backdoor) en la cámara Huawei HiWatch DS-2CD9530FWD-I8 (y otros modelos)

https://www.zdnet.com/article/researcher-backdoor-mechanism-still-active-in-many-iot-products/
https://www.huawei.com/en/psirt/security-notices/2020/huawei-sn-20200205-01-hisilicon-en
https://ipvm.com/reports/backdoor-9530




