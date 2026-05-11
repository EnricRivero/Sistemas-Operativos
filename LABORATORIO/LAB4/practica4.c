#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<unistd.h>
#include<string.h>

typedef struct {
 char country[64];
 char code[8];
 int year;
 float life_expectancy;
} LifeRecord;

void ordenar(){
    // Ordena por año e imprime los 10 primeros
}
int main (int argc, char * argv[]){

    if ( argc != 2 || argc != 3 ){
        printf("El nombre de paràmetres no és correcte.\n");
        return 1;
    }

    modo = atof(argv[1]); // Elige entre modo malloc y modo mmap
    archivo = atof(argv[2]); // Archivo .csv con los datos a almacenar
    sort = atof(argv[3]); // Permite la ordenación de los resultados por año

    if (modo == "malloc"){
        /*
        1. Reservar memoria inicial para 100 registros.
        2. Leer cada línea mediante fgets.
        3. Parsear datos usando strtok.
        4. Si la memoria se llena, duplicar la capacidad mediante realloc.
        5. Guardar los registros en memoria.
        6. Continuar hasta finalizar el fichero.
        */

    } else if (modo == "mmap"){
        /*
        1. Abrir fichero con open().
        2. Obtener tamaño con fstat().
        3. Mapear fichero con mmap().
        4. Recorrer memoria detectando saltos de línea.
        5. Parsear cada línea.
        6. Liberar memoria con munmap(). 
        */

    } else {
        printf("Este modo no existe");
    }
    ordenar();


    return 0;
}