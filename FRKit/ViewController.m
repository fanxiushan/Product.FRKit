//
//  ViewController.m
//  FRKit
//
//  Created by xiushanfan on 09/01/2017.
//  Copyright © 2017 Smartisan. All rights reserved.
//

#import "ViewController.h"
#import "FRButton.h"
#import "FRKAlertView.h"

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
    
    NSArray *otherTitleArr = @[@"hello",@"world"];
    FRAVOtherTapBlock otherTapBlock1 = ^(void) {
        NSLog(@"%@",[otherTitleArr objectAtIndex:0]);
    };
    FRAVOtherTapBlock otherTapBlock2 = ^(void) {
        NSLog(@"%@",[otherTitleArr objectAtIndex:1]);
    };
    FRKAlertView *alertView = [[FRKAlertView alloc] initWithTitle:@"Hello" message:@"s-----------   -----------"  cancelButtonTitle:@"Cancel" otherButtonTitles:otherTitleArr[0],otherTitleArr[1], nil];
    [alertView setCancelBlock:^{
        NSLog(@"cancel");
    } otherBlocks:@[otherTapBlock1,otherTapBlock2]];
    
    [alertView show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
