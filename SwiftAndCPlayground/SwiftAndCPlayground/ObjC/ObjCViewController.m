//
//  ObjCViewController.m
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#import "ObjCViewController.h"
//#import "SwiftAndCPlayground-Swift.h"

@interface ObjCViewController()

@property (nonatomic, weak) UIButton* swiftVC1Button;
@property (nonatomic, weak) UIButton* swiftVC2Button;

@end

@implementation ObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];

    UIButton* button = [[UIButton alloc] init];
    [button setTitle:@"Go To Swift View Controller 1" forState:UIControlStateNormal];
    [self.view addSubview:button];
    _swiftVC1Button = button;
    [button addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    button = [[UIButton alloc] init];
    [button setTitle:@"Go To Swift View Controller 2" forState:UIControlStateNormal];
    [self.view addSubview:button];
    _swiftVC2Button = button;
    [button addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextButtonClicked:(UIButton*)sender {
    if (sender == _swiftVC1Button) {
        auto id controller = getSwiftViewController();
        [controller swiftViewControllerDoSomething1:5];
        [controller swiftViewControllerDoSomething2:8];
        [controller swiftViewController2DoSomething1:3];
        [controller swiftViewController2DoSomething2:4];
        [self.navigationController pushViewController:controller animated:true];
    } else {
//        auto id controller = [[SwiftViewController2 alloc] init];
//        [controller doSomething1];
//        [self.navigationController pushViewController:controller animated:true];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [_swiftVC1Button sizeToFit];
    [_swiftVC2Button sizeToFit];
    _swiftVC1Button.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    _swiftVC2Button.center = CGPointMake(self.view.bounds.size.width / 2,
                                         self.view.bounds.size.height / 2 + _swiftVC1Button.bounds.size.height);
}

@end
