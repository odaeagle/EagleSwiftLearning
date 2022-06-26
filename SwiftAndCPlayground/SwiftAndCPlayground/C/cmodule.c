//
//  cmodule.c
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#include "cmodule.h"
#include "module2.h"
#include <stdlib.h>

intptr_t foo(intptr_t);
int goo(int, char**);

//intptr_t invoke_foo(intptr_t x) {
//    return foo(x);
//}

void test(int num) {
    printf("Number is %d\n", num);
    printf("Result %d\n", foo(num));
    
    char* arr[] = {"meta", "mates rulez"};
    goo(2, arr);
}

void test2(int argc, const char** argv) {
    for(int i = 0; i < argc; i++) {
        printf("%d => %s\n", i, argv[i]);
    }
}

struct posn make_posn(int x, int y) {
    struct posn p = {x, y};
    return p;
}

struct posn* create_posn() {
    struct posn* p = malloc(sizeof(struct posn));
    p->x = 5;
    p->y = 8;
    return p;
}

void free_posn(struct posn* p) {
    free(p);
}

void test3(struct posn* p) {
    printf("Posn.x = %d, .y = %d\n", p->x, p->y);
}
