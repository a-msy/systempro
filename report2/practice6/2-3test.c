int a_static = 1;

void print_var(char *name,int val){
    print_string(name);
    print_string(" = ");
    print_int(val);
    print_string("\n");
}

main(void){
    int a_auto = 1;
}