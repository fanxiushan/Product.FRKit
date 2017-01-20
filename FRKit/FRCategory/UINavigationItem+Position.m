//
//  UINavigationItem+Position.m
//  note
//
//  Created by xiushanfan on 12/01/2017.
//  Copyright © 2017 frank. All rights reserved.
//

#import "UINavigationItem+Position.h"
#import <objc/runtime.h>


#define kLeftRealBarBtnItemBaseTag          100
#define kLeftGapBarBtnItemBaseTag           200

static char * const kPddLeftBarButtonItemsKey = "kPddLeftBarButtonItemsKey";
static char * const kPddRightBarButtonItemsKey = "kPddRightBarButtonItemsKey";

@interface UINavigationItem() {
    
}

@end

@implementation UINavigationItem (Position)

- (UIBarButtonItem *)pdd_leftBarBtnItem {
    if (self.pdd_leftBarButtonItems.count > 0) {
        return [self.pdd_leftBarButtonItems objectAtIndex:0];
    }
    return nil;
}

- (UIBarButtonItem *)pdd_rightBarBtnItem {
    if (self.pdd_rightBarButtonItems.count > 0) {
        return [self.pdd_rightBarButtonItems objectAtIndex:0];
    }
    return nil;
}

- (void)setPdd_leftBarButtonItems:(NSArray *)pdd_leftBarButtonItems {
    objc_setAssociatedObject(self, kPddLeftBarButtonItemsKey, pdd_leftBarButtonItems, OBJC_ASSOCIATION_RETAIN);
    if (pdd_leftBarButtonItems) {
        NSMutableArray *leftBarBtnItemArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < pdd_leftBarButtonItems.count; i++) {
            UIBarButtonItem *barBtnItem = [pdd_leftBarButtonItems objectAtIndex:i];
            if (0 == i) {
                UIBarButtonItem *gapBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
                gapBarBtnItem.width = kLeftBarBtnLeftMargin;
                //Note:the array sequence is important!!
                [leftBarBtnItemArray addObject:gapBarBtnItem];
            }
            [leftBarBtnItemArray addObject:barBtnItem];
        }
        self.leftBarButtonItems = leftBarBtnItemArray;
    } else {
        self.leftBarButtonItem = nil;
        self.leftBarButtonItems = nil;
    }
}

- (NSArray *)pdd_leftBarButtonItems {
    return objc_getAssociatedObject(self, kPddLeftBarButtonItemsKey);
}


- (void)setPdd_rightBarButtonItems:(NSArray *)pdd_rightBarButtonItems {
    objc_setAssociatedObject(self, kPddRightBarButtonItemsKey, pdd_rightBarButtonItems, OBJC_ASSOCIATION_RETAIN);
    NSMutableArray *rightBarBtnItemArray = [NSMutableArray arrayWithCapacity:0];
    if (pdd_rightBarButtonItems) {
        for (int i = 0; i < pdd_rightBarButtonItems.count; i++) {
            UIBarButtonItem *barBtnItem = [pdd_rightBarButtonItems objectAtIndex:i];
            if (0 == i) {
                UIBarButtonItem *gapBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
                gapBarBtnItem.width = kRightBarBtnRightMargin;
                //Note:the array sequence is important!!
                [rightBarBtnItemArray addObject:gapBarBtnItem];
            }
            [rightBarBtnItemArray addObject:barBtnItem];
        }
        self.rightBarButtonItems = rightBarBtnItemArray;
    } else {
        self.rightBarButtonItems = nil;
        self.rightBarButtonItem = nil;
    }
}

- (NSArray *)pdd_rightBarButtonItems {
    return objc_getAssociatedObject(self, kPddRightBarButtonItemsKey);
}

- (void)setPdd_leftBarButtonItemsEnable:(BOOL)pdd_leftBarButtonItemEnable {
    for (UIBarButtonItem *barBtnItem in self.leftBarButtonItems) {
        barBtnItem.enabled = pdd_leftBarButtonItemEnable;
    }
}

- (void)setPdd_rightBarButtonItemsEnable:(BOOL)pdd_rightBarButtonItemEnable {
    for (UIBarButtonItem *barBtnItem in self.rightBarButtonItems) {
        barBtnItem.enabled = pdd_rightBarButtonItemEnable;
    }
}

- (void)setPdd_allBarButtonItemsEnable:(BOOL)pdd_allBarButtonItemsEnable {
    self.pdd_leftBarButtonItemsEnable = pdd_allBarButtonItemsEnable;
    self.pdd_rightBarButtonItemsEnable = pdd_allBarButtonItemsEnable;
}

- (void)setPdd_rightBarButtonItemsHidden:(BOOL)pdd_rightBarButtonItemsHidden {
    for (UIBarButtonItem *barBtnItem in self.rightBarButtonItems) {
        barBtnItem.customView.hidden = pdd_rightBarButtonItemsHidden;
    }
}

- (CGFloat)titleViewWidthOfBarWidth:(CGFloat)tNavBarWidth {
    CGFloat leftBarBtnsWidth = 0;
    for (UIBarButtonItem *leftBarBtn in self.leftBarButtonItems) {
        leftBarBtnsWidth = leftBarBtn.width + leftBarBtnsWidth;
    }
    CGFloat rightBarBtnsWidth = 0;
    for (UIBarButtonItem *rightBarBtn in self.rightBarButtonItems) {
        rightBarBtnsWidth = rightBarBtn.width + rightBarBtnsWidth;
    }
    return tNavBarWidth - leftBarBtnsWidth - rightBarBtnsWidth;
}



@end
