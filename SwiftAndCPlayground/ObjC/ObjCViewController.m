//
//  ObjCViewController.m
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

#import "ObjCViewController.h"

@interface ObjCViewController()

@property (nonatomic, weak) UIButton* nextButton;

@end

@implementation ObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];

    UIButton* button = [[UIButton alloc] init];
    [button setTitle:@"Go To Swift View Controller" forState:UIControlStateNormal];

    [self.view addSubview:button];
    _nextButton = button;
    [button addTarget:self action:@selector(nextButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextButtonClicked {
    UIViewController* controller = getSwiftViewController();
    [self.navigationController pushViewController:controller animated:true];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [_nextButton sizeToFit];
    _nextButton.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
}

@end
