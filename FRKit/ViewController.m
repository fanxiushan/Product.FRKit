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
#import "UIView+Debug.h"

@interface ViewController () {
    UILabel *testLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 356)];
    testLabel.font = [UIFont systemFontOfSize:15.0f];
    testLabel.backgroundColor = [UIColor redColor];
    testLabel.text = @"Hello world";
    testLabel.adjustsFontSizeToFitWidth = YES;
    
    
    UILabel *testLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 90, 50)];
    testLabel1.font = [UIFont systemFontOfSize:15.0f];
    testLabel1.backgroundColor = [UIColor redColor];
    testLabel1.text = @"Hello world";
    testLabel1.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:testLabel1];
    
    UILabel *testLabe2 = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 70, 50)];
    testLabe2.font = [UIFont systemFontOfSize:15.0f];
    testLabe2.backgroundColor = [UIColor redColor];
    testLabe2.text = @"Hello world";
    testLabe2.adjustsFontSizeToFitWidth = YES;
    [testLabel1 addSubview:testLabe2];
    [testLabel addSubview:testLabel1];
    
    [self.view addSubview:testLabel];
    
    testLabel.frk_debugMode = YES;
    [testLabel addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(50, 50, 200, 100);
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"PressMe" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)btnPressed:(UIButton *)btn {
    testLabel.frame = CGRectMake(200, 200, 200, 356);
}


- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context {
    NSLog(@"ViewController keyPath = %@, object = %@, change = %@",keyPath,object,change);
    CGRect rect1 = ((NSValue *)[change objectForKey:@"old"]).CGRectValue;
    CGRect rect2 = ((NSValue *)[change objectForKey:@"new"]).CGRectValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
