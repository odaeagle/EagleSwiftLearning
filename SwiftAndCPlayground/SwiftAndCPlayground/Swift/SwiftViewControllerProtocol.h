//
//  SwiftViewControllerProtocol.h
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#ifndef SwiftViewControllerProtocol_h
#define SwiftViewControllerProtocol_h

@protocol SwiftViewControllerProtocol <NSObject>

- (void)swiftViewControllerDoSomething1:(int)num;
- (void)swiftViewControllerDoSomething2:(int)num;

@end

@protocol SwiftViewControllerProtocol2 <NSObject>

- (void)swiftViewController2DoSomething1:(int)num;
- (void)swiftViewController2DoSomething2:(int)num;

@end


#endif /* SwiftViewControllerProtocol_h */
