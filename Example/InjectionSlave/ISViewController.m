//
//  ISViewController.m
//  InjectionSlave
//
//  Created by OneSlave on 01/12/2024.
//  Copyright (c) 2024 OneSlave. All rights reserved.
//

#import "ISViewController.h"
#import <UIViewController+Injection.h>

@interface ISViewController ()
@property (nonatomic, strong) UIView *bgView;
@end

@implementation ISViewController

- (void)injectedNotifi {
    [super injectedNotifi];
    [self viewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgView = [UIView new];
    self.bgView.frame = self.view.bounds;
    [self.view addSubview:self.bgView];
	self.bgView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
