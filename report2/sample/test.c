#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#include "myvprintf.h"

void myputc(int c)
{
    putc(c, stdout);
}


void myprintf(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	myvprintf(myputc,fmt, ap);
	va_end(ap);
}


void main()
{
    char *msg = "hello world!";
    
    myprintf("%s\n", msg);
    myprintf("%'d\n", 1000000);
    myprintf("%07x\n", 21050);
    myprintf("%#x\n", 255);
    myprintf("%#X\n", 255);
}
