//
//  FRButton.h
//  FRKit
//
//  Created by xiushanfan on 09/01/2017.
//  Copyright © 2017 frk. All rights reserved.
//

/* Snippets
 
 FRButton *frBtn = [FRButton buttonWithType:UIButtonTypeCustom];
 frBtn.frame = CGRectMake(50, 50, 200, 60);
 [frBtn setTitle:@"FRButton" forState:UIControlStateNormal];
 [frBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
 [frBtn setTouchUpInsideBlock:^(FRButton *btn) {
 NSLog(@"hello world");
 }];
 [self.view addSubview:frBtn];
 
 */



#import <UIKit/UIKit.h>

@class FRButton;

typedef void(^FRTapBlock)(FRButton *);

@interface FRButton : UIButton

- (void)setTouchUpInsideBlock:(FRTapBlock)tTapBlock;


@end
