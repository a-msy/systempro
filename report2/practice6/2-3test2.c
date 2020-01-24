#include <stdio.h>

int main(void){
    printf("TEST\n");
    printf("%%d:%d\n%%5d:%5d\n%%-5d:%-5d\n",100,100,100);
    printf("%%d:%d\n%%5d:% 5d\n%%-5d:%-5d\n",100,100,100);
    printf("%%x:%#x\n%%X:%X\n",15,15);
    printf("%%o:%#o\n",15);
    printf("%%s:%s\n%%5s:%5s\n%%5.2s:%5.2s\n","Say","Say","Say");
    printf("%%c:%c\n",'a');
    return 0;
}