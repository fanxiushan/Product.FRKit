//
//  UINavigationItem+Position.h
//  note
//
//  Created by xiushanfan on 12/01/2017.
//  Copyright © 2017 frank. All rights reserved.
//

//Note default navigation item don't support set navigation barButtomItem's frame.
//This category make a middle layer to support reposion navigation items

#import <UIKit/UIKit.h>

//The less,the lefter.
#define kLeftBarBtnLeftMargin       -10

//The less,the righter.
#define kRightBarBtnRightMargin     -10

//Notice:this category work with PDNavigationBar to config the navigationItem.leftBarBtnItems&rightBarBtnItems's frame.
//The 'UIBarButtonSystemItemFixedSpace' has minmum gap 8pix,no way to make the barBtnItem's middle gap more smaller.But it work perfect to config the navigationItem's right/left margin.


@interface UINavigationItem (Position)

@property (nonatomic, strong, readonly) UIBarButtonItem *pdd_leftBarBtnItem;
@property (nonatomic, strong, readonly) UIBarButtonItem *pdd_rightBarBtnItem;

@property (nonatomic, strong) NSArray *pdd_leftBarButtonItems;
@property (nonatomic, strong) NSArray *pdd_rightBarButtonItems;

@property (nonatomic, assign) BOOL pdd_leftBarButtonItemsEnable;
@property (nonatomic, assign) BOOL pdd_rightBarButtonItemsEnable;
@property (nonatomic, assign) BOOL pdd_allBarButtonItemsEnable;

@property (nonatomic, assign) BOOL pdd_rightBarButtonItemsHidden;

- (CGFloat)titleViewWidthOfBarWidth:(CGFloat)tNavBarWidth;

@end

//Code Snippets

//FRBarButtonItem *leftBtn = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello");
//}];
//FRBarButtonItem *leftBtn1 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello2");
//}];
//FRBarButtonItem *leftBtn2 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello3");
//}];
//self.navigationItem.pdd_leftBarButtonItems = @[leftBtn,leftBtn1,leftBtn2];
//
//
//FRBarButtonItem *rightBtn = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello");
//}];
//FRBarButtonItem *rightBtn1 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello2");
//}];
//__weak __typeof(self)weakSelf = self;
//FRBarButtonItem *rightBtn2 = [[FRBarButtonItem alloc] initWithTitle:@"xxx" style:UIBarButtonItemStyleDone target:self tapBlock:^(UIBarButtonItem *item) {
//    NSLog(@"hello3");
//    NSLog(@"WEAKSELF = %@",weakSelf.navigationItem.pdd_rightBarButtonItems);
//}];
//self.navigationItem.pdd_rightBarButtonItems = @[rightBtn,rightBtn1,rightBtn2];
