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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 356)];
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
