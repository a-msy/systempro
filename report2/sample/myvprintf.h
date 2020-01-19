#ifndef MYVPRINTF_H
#define MYVPRINTF_H 1


#include <stdarg.h>

void myvprintf(void (*__putc)(int),  const char *fmt, va_list ap);


#endif

