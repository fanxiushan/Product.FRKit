//
//  FRKNavigationBar.m
//  FRKit
//
//  Created by xiushanfan on 20/01/2017.
//  Copyright © 2017 Frank. All rights reserved.
//

#import "FRKNavigationBar.h"


typedef enum : NSUInteger {
    kNavigationBarBtnLeftType,
    kNavigationBarBtnRightType,
} NavigationBarBtnType;

@implementation FRKNavigationBar

- (void)layoutSubviews {
    [super layoutSubviews];
    NSMutableArray *leftBtnViews = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *rightBtnViews = [NSMutableArray arrayWithCapacity:0];
    for (UIView *subView  in self.subviews) {
        NSString *uiNavigationButtonClassName = [NSString stringWithFormat:@"%@%@%@",@"UI",@"Navigation",@"Button"];
        if ([subView isKindOfClass:[UIButton class]] || [subView isKindOfClass:NSClassFromString(uiNavigationButtonClassName)]) {
            subView.backgroundColor = [UIColor grayColor];
            if (subView.frame.origin.x < self.frame.size.width /2) {
                [leftBtnViews addObject:subView];
            } else {
                [rightBtnViews addObject:subView];
            }
        }
    }
    //-----
    [leftBtnViews sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return ((UIView *)obj1).frame.origin.x > ((UIView *)obj2).frame.origin.x;
    }];
    //Note: rightBtnViews sorted by left,the most left btn as the first btn in array.
    [rightBtnViews sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return ((UIView *)obj1).frame.origin.x > ((UIView *)obj2).frame.origin.x;
    }];
    [self reconfigFrameBarBtnViews:leftBtnViews WithType:kNavigationBarBtnLeftType];
    [self reconfigFrameBarBtnViews:rightBtnViews WithType:kNavigationBarBtnRightType];
}

- (void)reconfigFrameBarBtnViews:(NSArray *)tBtnViews WithType:(NavigationBarBtnType)tNavigationBarBtnType {
    CGFloat gap = 0;
    switch (tNavigationBarBtnType) {
        case kNavigationBarBtnLeftType:{
            gap = kLeftGap;
        }
            break;
        case kNavigationBarBtnRightType:{
            gap = kRightGap;
        }
            break;
    }
    if (tBtnViews.count > 0) {
        for (int i = 0; i < tBtnViews.count-1; i++) {
            UIView *subView = [tBtnViews objectAtIndex:i];
            UIView *nextSubView = [tBtnViews objectAtIndex:i+1];
            if ((subView.frame.origin.x + subView.frame.size.width + gap) < nextSubView.frame.origin.x ) {
                subView.frame = CGRectMake(nextSubView.frame.origin.x - gap - subView.frame.size.width, subView.frame.origin.y, subView.frame.size.width, subView.frame.size.height);
            }
        }
    }
}


@end
