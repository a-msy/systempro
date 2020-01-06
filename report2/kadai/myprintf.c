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
                break;
            case 'c':
                break;
            }
        }
        else{
            printf_char(*fmt);
        }
        fmt++;
    }
}
