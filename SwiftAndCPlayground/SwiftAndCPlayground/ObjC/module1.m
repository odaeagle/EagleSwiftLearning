//
//  module1.m
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#import <Foundation/Foundation.h>
#import "module1.h"

@implementation Module1

-(id _Nonnull)initWithWidth:(double)width height:(double)height {
    if (self = [super init]) {
        self->width = width;
        self.height = height;
    }
    return self;
}

-(double)areaWithType:(AreaType)type {
    [self.delegate module1WillReturnArea];
    if (type == AreaTypeSquare) {
        return self->width * self.height;
    } else {
        return self->width * self.height / 2;
    }
}

@end
