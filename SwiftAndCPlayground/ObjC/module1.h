//
//  module1.h
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#ifndef module1_h
#define module1_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AreaType) {
    AreaTypeSquare,
    AreaTypeTriangle,
};

@protocol Module1Delegate <NSObject>

- (void)module1WillReturnArea;

@end

@interface Module1: NSObject {
    double width;
}

@property(nonatomic, readwrite) double height;
@property (nonatomic, weak) id <Module1Delegate> _Nullable delegate;

- (id _Nonnull)initWithWidth:(double)width height:(double)height;
- (double)areaWithType:(AreaType)type;

@end


#endif /* module1_h */
