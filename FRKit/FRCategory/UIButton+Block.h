//
//  UIButton+Block.h
//  FRKit
//
//  Created by xiushanfan on 11/01/2017.
//  Copyright © 2017 Smartisan. All rights reserved.
//

#import <UIKit/UIKit.h>


/* 
 FRButton *frBtn = [FRButton buttonWithType:UIButtonTypeCustom];
 frBtn.frame = CGRectMake(50, 50, 200, 60);
 [frBtn setTitle:@"FRButton" forState:UIControlStateNormal];
 [frBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
 frBtn.touchUpSideTapBlock = ^(UIButton *btn){
 NSLog(@"btn = %@ ",btn);
 };
 [self.view addSubview:frBtn];
 */


typedef void(^BtnTapBlock)(UIButton *);

@interface UIButton (Block)

@property (nonatomic, strong) BtnTapBlock touchUpSideTapBlock;

@end
