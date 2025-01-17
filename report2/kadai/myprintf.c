#define ROUNDUP_SIZEOF(x) (((sizeof(x)+3)/4)*4)

#define ZERO_PADDING         (1<<1)//000001 シフト演算
#define ALTERNATIVE          (1<<2)//000010
#define THOUSAND_GROUP       (1<<3)//000100
#define CAPITAL_LETTER       (1<<4)//001000
#define WITH_SIGN_CHAR       (1<<5)//010000
#define LEFT_JUSTIFIED       (1<<6)//100000

#define _isnumc(x) ( (x) >= '0' && (x) <= '9' )
#define _ctoi(x)   ( (x) -  '0' )//0という文字を基準として引き算すれば数字文字を示す数値になる

int my_strlen(char* str){
    int length = 0; //文字列の長さを入れる箱
 
   //文字列の長さを数える
    while(*str++ != '\0'){
        length++;
    }
    return length;
}

char * mystrchr(const char *s, int c)
{//対応する文字を検索する
    char ch = (char) c;
    while (*s) {
        if (*s == ch)
            return (char *) s;
        s++;
    }
    return '\0';
}

void print_char(char c){
    //ヌル文字が格納されいなければならない
    //文字単体はasciizでアセンブリで扱われないからヌル文字が入らない。その処理
    //null入れなくても動いた
    char s[2];
    s[0]=c;
    s[1]='\0';
    print_string(s);
}

void put_int(int n, int base, int length, char sign, int flags){

    char *symbols_s = "0123456789abcdef";
    char *symbols_c = "0123456789ABCDEF";
    char buf[80];
    int i = 0;
    int pad = ' ';
    char *symbols = symbols_s;

    if(flags & CAPITAL_LETTER){
        symbols = symbols_c;
    }

    do {
        buf[i++] = symbols[n % base];
        if( (flags & THOUSAND_GROUP) && (i%4)==3) buf[i++] = ',';
    } while (n /= base);

    length = length - i;

    if (!(flags & LEFT_JUSTIFIED)) {
        if(flags & ZERO_PADDING){
            pad = '0';
        }
        while (length > 0) { 
            length--; 
            buf[i++] = pad;
        }
    }

    if (sign && base == 10){
        buf[i++] = sign;
    }
    
    if (flags & ALTERNATIVE){
        if (base == 8){
            buf[i++] = '0';
        }
        else if (base == 16){
            buf[i++] = 'x';
            buf[i++] = '0';
        }
    }

    while (i > 0){ 
        print_char(buf[--i]);      
    }

    while (length>0){
        length--;
        print_char(pad);
    }

}

void myprintf(char *fmt, ...){
    //第２引数以降を格納するために利用する。
    //fmtのアドレスにfmtのサイズ分追加する。charとして扱うためにキャスト。なくてもうごいた
    char *p = ((char*)&fmt)+ROUNDUP_SIZEOF(fmt);

    while(*fmt){

        int flags = 0;
        int length = 0;
        int precision = 0;
        int tmp = 0;
        char sign = '\0';
        char *s = '\0';

        if(*fmt == '%'){
            fmt++;//次を見る

            while (mystrchr("'-+ #0", *fmt)) {
                switch (*fmt) {
                case '\'': 
                    flags |= THOUSAND_GROUP;             
                    break;
                case  '-': 
                    flags |= LEFT_JUSTIFIED;             
                    break;
                case  '+': 
                    flags |= WITH_SIGN_CHAR; 
                    sign = '+'; 
                    break;
                case  '#': 
                    flags |= ALTERNATIVE;                
                    break;
                case  '0': 
                    flags |= ZERO_PADDING;               
                    break;
                case  ' ': 
                    flags |= WITH_SIGN_CHAR; 
                    sign = ' '; 
                    break;
                }
                fmt++;
            }

            while( _isnumc(*fmt)){
                length = (length*10)+_ctoi(*fmt++);
            }

            if (*fmt == '.'){
                fmt++;//次の数字を見る
                if (*fmt == '*'){//ワイルドカードでの文字列検索
                    fmt++;
                    precision = *(int*)p;
                }
                else { 
                    while (_isnumc(*fmt) ){
                        precision = precision * 10 + _ctoi(*fmt++);
                    }
                }
            }

            switch(*fmt){
            case 'd':
            case 'i':
                //print_int(*(int*)p);//pの中身の値をintとしてキャストし表示する
                 if(*(int*)p < 0){
                     *(int*)p *= -1;//そのままマイナスだと表示されない
                  sign = '-';
                }
                put_int(*(int*)p,10,length,sign,flags);
                p = p + ROUNDUP_SIZEOF(int);
                break;
            case 's':
                //print_string(*(char**)p);
                s = *(char**)p;
                if(s == '\0'){
                    s = "(null)";
                }
                tmp = my_strlen(s);
                if (precision && precision < tmp){
                    tmp = precision;
                }
                length = length - tmp;
                if (!(flags & LEFT_JUSTIFIED)){   
                    while ( length > 0 ){
                        length--;
                        print_char(' ');
                    } 
                }
                while (tmp--){
                    print_char(*s++);
                }
                while (length > 0){
                    length--;
                    print_char(' ');
                }
                p = p + ROUNDUP_SIZEOF(char*);

                break;
            case 'c':
                print_char(*(char*)p);
                p = p + ROUNDUP_SIZEOF(char);
                break;
            case '%':
                print_char('%');
                break;
            case 'X':
                flags |= CAPITAL_LETTER;
            case 'x':
                put_int(*(int*)p,16,length,sign,flags);
                p= p + ROUNDUP_SIZEOF(int);
                break;
            case 'o':
                put_int(*(int*)p,8,length,sign,flags);
                p=p+ROUNDUP_SIZEOF(int);
                break;
            }
        }

        else{
            print_char(*fmt);
        }
        fmt++;
    }
}

int main()
{
    myprintf("TEST\n");
    myprintf("%%d:%d\n%%5d:%5d\n%%-5d:%-5d\n",100,100,100);
    myprintf("%%x:%x\n%%X:%X\n",15,15);
    myprintf("%%o:%o\n",15);
    myprintf("%%s:%s\n%%5s:%5s\n%%5.2s:%5.2s\n","Say","Say","Say");
    myprintf("%%c:%c\n",'a');
    return 0;
}
