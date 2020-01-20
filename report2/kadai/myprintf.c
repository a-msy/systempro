#define ROUNDUP_SIZEOF(x) (((sizeof(x)+3)/4)*4)

void print_char(char c){
    //ヌル文字が格納されいなければならない
    //文字単体はasciizでアセンブリで扱われないからヌル文字が入らない。その処理
    //null入れなくても動いた
    char s[2];
    s[0]=c;
    s[1]='\0';
    print_string(s);
}

/* XXX: caller MUST check base is 2 .. 16 */
void radix_print(unsigned int n, int base)
{
  if (n >= base) radix_print(n / base, base);
  putchar("0123456789ABCDEF"[n % base]);
}

void swap_char_at(char *s, char *t)
{
  char c;

  c = *t;
  *t = *s;
  *s = c;
}

/* sprintf-like version of radix_print */
void radix_sprint(char *s, unsigned int n, int base)
{
  char *h = s;

  do {
    *s++ = "0123456789ABCDEF"[n % base];//"文字列"という配列の[何番目]か
    n = n / base;
  } while (n > 0);

  *s-- = '\0';  
  /* terminate string and point
  back at the last char of the string. */

  /* reverse string */
  while (h < s){
    swap_char_at(h++, s--);//逆順に入っているから転置
  }
}

void myprintf(char *fmt, ...){
    //第２引数以降を格納するために利用する。
    //fmtのアドレスにfmtのサイズ分追加する。charとして扱うためにキャスト。なくてもうごいた
    char *p = ((char*)&fmt)+ROUNDUP_SIZEOF(fmt);
    while(*fmt){
        if(*fmt == '%'){
            fmt++;
            switch(*fmt){
                case 'd':
                    print_int(*(int*)p);//pの中身の値をintとしてキャストし表示する
                    p = p + ROUNDUP_SIZEOF(int);
                    break;
                case 's':
            	    print_string(*(char**)p);
	                p = p + ROUNDUP_SIZEOF(char*);
                    break;
                case 'c':
            	    print_char(*(char*)p);
	                p = p + ROUNDUP_SIZEOF(char);
                    break;
                case '%':
                  print_char(*(char*)p);
	                p = p + ROUNDUP_SIZEOF(char);
                    break;
            }
        }
        else{
            printf_char(*fmt);
        }
        fmt++;
    }
}

int main()
{
  myprintf("TEST %d is %c %s ...%%s\n", 99, 'x', "OK");
  myprintf("All done\n");
  return 0;
}