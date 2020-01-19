#include<stdio.h>

int main(void){
    char array[3] ="abc";
    char *pointer;

    pointer = array;

    printf("array   = %p\n", array);
    printf("pointer = %p\n", pointer);

    printf("array[2]   = %c\n", array[2]);
    printf("pointer[2] = %c\n", array[2]);

    printf("*array   = %c\n", *array);
    printf("*pointer = %c\n", *pointer);

    printf("&array   = %p\n", &array);
    printf("&pointer = %p\n", &pointer);

    return 0;
}