//
//  ViewController.m
//  FRKit
//
//  Created by xiushanfan on 09/01/2017.
//  Copyright © 2017 frk. All rights reserved.
//

#import "ViewController.h"
#import "FRButton.h"
#import "FRKAlertView.h"
#import "UIButton+Block.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FRButton *frBtn = [FRButton buttonWithType:UIButtonTypeCustom];
    frBtn.frame = CGRectMake(50, 50, 200, 60);
    [frBtn setTitle:@"FRButton" forState:UIControlStateNormal];
    [frBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    frBtn.touchUpSideTapBlock = ^(UIButton *btn){
        NSLog(@"btn = %@ ",btn);
    };
    [self.view addSubview:frBtn];


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
