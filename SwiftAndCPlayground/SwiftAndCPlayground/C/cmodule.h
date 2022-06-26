//
//  cmodule.h
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#ifndef cmodule_h
#define cmodule_h

#include <stdio.h>

struct posn {
    int x;
    int y;
};

struct posn make_posn(int x, int y);
void test(int num);
void test2(int argc, const char** argv);
void test3(struct posn*);

struct posn* create_posn();
void free_posn(struct posn*);


#endif /* cmodule_h */
