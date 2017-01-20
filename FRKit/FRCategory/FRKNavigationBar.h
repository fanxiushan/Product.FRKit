//
//  FRKNavigationBar.h
//  FRKit
//
//  Created by xiushanfan on 20/01/2017.
//  Copyright © 2017 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

CGFloat const kRightGap = 2;
CGFloat const kLeftGap = 10;



@interface FRKNavigationBar : UINavigationBar

@end

//Code Snippets.
//FRBarButtonItem *leftBtn = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello");
//}];
//FRBarButtonItem *leftBtn1 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello2");
//}];
////
//FRBarButtonItem *rightBtn = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello");
//}];
//FRBarButtonItem *rightBtn1 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello2");
//}];
//rightBtn.tag = 100;
//
//FRBarButtonItem *gap = [[FRBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//gap.width = -10;
//
//self.navigationItem.rightBarButtonItems = @[gap,rightBtn,rightBtn1];
//self.navigationItem.leftBarButtonItems = @[gap,leftBtn,leftBtn1];
