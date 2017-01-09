//
//  ViewController.m
//  FRKit
//
//  Created by xiushanfan on 09/01/2017.
//  Copyright © 2017 Smartisan. All rights reserved.
//

#import "ViewController.h"
#import "FRButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FRButton *frBtn = [FRButton buttonWithType:UIButtonTypeCustom];
    frBtn.frame = CGRectMake(50, 50, 200, 60);
    [frBtn setTitle:@"FRButton" forState:UIControlStateNormal];
    [frBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [frBtn setTouchUpInsideBlock:^(FRButton *btn) {
        NSLog(@"hello world");
    }];
    [self.view addSubview:frBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
