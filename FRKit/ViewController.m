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
#import "FRBarButtonItem.h"
#import "UINavigationItem+Position.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FRBarButtonItem *leftBtn = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
        NSLog(@"hello");
    }];
    FRBarButtonItem *leftBtn1 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
        NSLog(@"hello2");
    }];
    FRBarButtonItem *leftBtn2 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
        NSLog(@"hello3");
    }];
    self.navigationItem.pdd_leftBarButtonItems = @[leftBtn,leftBtn1,leftBtn2];
    
    
    FRBarButtonItem *rightBtn = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
        NSLog(@"hello");
    }];
    FRBarButtonItem *rightBtn1 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
        NSLog(@"hello2");
    }];
    __weak __typeof(self)weakSelf = self;
    FRBarButtonItem *rightBtn2 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
        NSLog(@"hello3");
        NSLog(@"WEAKSELF = %@",weakSelf.navigationItem.pdd_rightBarButtonItems);
    }];
    self.navigationItem.pdd_rightBarButtonItems = @[rightBtn,rightBtn1,rightBtn2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
