#include <stdarg.h>

int sum(int nfirst, ...)
{
  int r = 0, n;
  va_list args;

  va_start(args, nfirst);
  for (n = nfirst; n != 0; n = va_arg(args, int)) r += n;
  va_end(args);

  return r;
}

int call_sum(int a[10])
{
  return sum(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
}