//
//  ObjCViewController.h
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SwiftViewControllerProtocol.h"

UIViewController<SwiftViewControllerProtocol>* getSwiftViewController(void);

NS_ASSUME_NONNULL_BEGIN

@interface ObjCViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
