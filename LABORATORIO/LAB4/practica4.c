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

LifeRecord *records = NULL;
int total_records = 0;

int comparar_per_any(const void *a, const void *b) {
    const LifeRecord *ra = (const LifeRecord *)a;
    const LifeRecord *rb = (const LifeRecord *)b;
    return ra->year - rb->year;
}

void ordenar() {
    qsort(records, total_records, sizeof(LifeRecord), comparar_per_any);

    int limit = total_records < 10 ? total_records : 10;
    printf("%-40s %-8s %-6s %s\n", "País", "Código", "Año", "Esperanza de vida");
    printf("--------------------------------------------------------------------\n");
    for (int i = 0; i < limit; i++) {
        printf("%-40s %-8s %-6d %.2f\n", records[i].country, records[i].code, records[i].year, records[i].life_expectancy);
    }
}

int main (int argc, char * argv[]){

    // 2 o 3 arguments
    if (argc < 3 || argc > 4) {
        printf("Uso: %s <malloc|mmap> <archivo.csv> [sort]\n", argv[0]);
        return 1;
    }

    char *modo = argv[1]; // Mode malloc o mmap
    char *archivo = argv[2]; // Archiu .csv amb les dades
    int sort = (argc == 4 && strcmp(argv[3], "sort") == 0); // S'ordena per any i s'agafen els 10 primers

    if (strcmp(modo, "malloc") == 0) {
        modo_malloc(archivo);

    } else if (strcmp(modo, "mmap") == 0) {
        modo_mmap(archivo);
        
    } else {
        printf("Modo '%s' no existe. Usa 'malloc' o 'mmap'.\n", modo);
        return 1;
    }

    if (sort) {
        printf("Primeros 10 registros:");
        ordenar();
    }

    return 0;
}

void modo_malloc(archivo){
        /*
        1. Reservar memoria inicial para 100 registros.
        2. Leer cada línea mediante fgets.
        3. Parsear datos usando strtok.
        4. Si la memoria se llena, duplicar la capacidad mediante realloc.
        5. Guardar los registros en memoria.
        6. Continuar hasta finalizar el fichero.
        */
}

void modo_mmap(archivo){
        /*
        1. Abrir fichero con open().
        2. Obtener tamaño con fstat().
        3. Mapear fichero con mmap().
        4. Recorrer memoria detectando saltos de línea.
        5. Parsear cada línea.
        6. Liberar memoria con munmap(). 
        */
}