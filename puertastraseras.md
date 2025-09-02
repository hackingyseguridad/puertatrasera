## Puertas traseras en routers


## Huawei B315s-22.- Router Huawei Home Gateway WiFi 4G/LTE

Puerta trasera ("backdoor") oculto en el software de equipos Huawei; puerto "disparador" UDP 9537. este es el puerto secreto que activaba la puerta trasera, por TELNET. El puerto telnet Backdoor solo se activaba si el equipo de Huawei recibia un paquete al puerto 9537/UDP.- Esto activaba  como un interruptor el servicio Telnet oculto en el equipo que inicia la escucha en el puerto telnet 23/tcp,  con credenciales por defecto o hardcodeada -  Huawei argumentó que este acceso era parte de una funcionalidad de diagnóstico para mantenimiento y no una puerta trasera malintencionada, pero Vodafone y los organismos de seguridad consideraron que su naturaleza oculta y no documentada representaba un grave riesgo de seguridad.

https://www.bloomberg.com/news/articles/2019-04-30/vodafone-found-hidden-backdoors-in-huawei-equipment

https://www.exploit-db.com/exploits/45971

https://comunidad.movistar.es/t5/Soporte-M%C3%B3vil/Configuraci%C3%B3n-de-router-B315s-22-con-tarjeta-SIM/td-p/4128607

## Huawei,  routers series: HGxxx, EchoLife

Se identifico  en el puerto 37215/tcp servicio que permitía el acceso no autenticado ( interface WAN ) o con credenciales por defecto ocultas exponiendo una shell de administración. - también, se argumentó que era para el mantenimiento remoto del ISP.




