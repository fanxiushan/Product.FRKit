//
//  FRKAlertView.h
//  FRKit
//
//  Created by xiushanfan on 09/01/2017.
//  Copyright © 2017 Smartisan. All rights reserved.
//

/* 
 Snippets:
 
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
 */

#import <UIKit/UIKit.h>

typedef void(^FRAVCancelTapBlock)(void);
typedef void(^FRAVOtherTapBlock)(void);

@interface FRKAlertView : UIAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...;

- (void)setCancelBlock:(FRAVCancelTapBlock)tCancelTapBlock otherBlocks:(NSArray *)tOtherTapBlocks;

@end
