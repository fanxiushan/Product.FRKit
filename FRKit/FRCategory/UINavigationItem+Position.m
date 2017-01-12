//
//  UINavigationItem+Position.m
//  note
//
//  Created by xiushanfan on 12/01/2017.
//  Copyright © 2017 smartisan. All rights reserved.
//

#import "UINavigationItem+Position.h"
#import <objc/runtime.h>

//The less,the lefter.
#define kLeftBarBtnLeftMargin       -10
#define kLeftBarBtnMiddleMargin     50

//The less,the righter.
#define kRightBarBtnRightMargin     -10
#define kRightBarBtnMiddleMargin    10


#define kLeftRealBarBtnItemBaseTag          100
#define kLeftGapBarBtnItemBaseTag           200

const char *kPddLeftBarButtonItemsKey = "kPddLeftBarButtonItemsKey";
const char *kPddRightBarButtonItemsKey = "kPddRightBarButtonItemsKey";

@interface UINavigationItem() {
    
}

@end

@implementation UINavigationItem (Position)

- (void)setPdd_leftBarButtonItems:(NSArray *)pdd_leftBarButtonItems {
    objc_setAssociatedObject(self, kPddLeftBarButtonItemsKey, pdd_leftBarButtonItems, OBJC_ASSOCIATION_COPY);
    NSMutableArray *leftBarBtnItemArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < pdd_leftBarButtonItems.count; i++) {
        UIBarButtonItem *barBtnItem = [pdd_leftBarButtonItems objectAtIndex:i];
        UIBarButtonItem *gapBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        if (0 == i) {
            gapBarBtnItem.width = kLeftBarBtnLeftMargin;
        } else {
            gapBarBtnItem.width = kLeftBarBtnMiddleMargin;
        }
        //Note:the array sequence is important!!
        [leftBarBtnItemArray addObject:gapBarBtnItem];
        [leftBarBtnItemArray addObject:barBtnItem];
    }
    self.leftBarButtonItems = leftBarBtnItemArray;
}

- (NSArray *)pdd_leftBarButtonItems {
    return objc_getAssociatedObject(self, kPddLeftBarButtonItemsKey);
}


- (void)setPdd_rightBarButtonItems:(NSArray *)pdd_rightBarButtonItems {
    objc_setAssociatedObject(self, kPddRightBarButtonItemsKey, pdd_rightBarButtonItems, OBJC_ASSOCIATION_COPY);
    NSMutableArray *rightBarBtnItemArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < pdd_rightBarButtonItems.count; i++) {
        UIBarButtonItem *barBtnItem = [pdd_rightBarButtonItems objectAtIndex:i];
        UIBarButtonItem *gapBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        if (0 == i) {
            gapBarBtnItem.width = kRightBarBtnRightMargin;
        } else {
            gapBarBtnItem.width = kRightBarBtnMiddleMargin;
        }
        //Note:the array sequence is important!!
        [rightBarBtnItemArray addObject:gapBarBtnItem];
        [rightBarBtnItemArray addObject:barBtnItem];
    }
    self.rightBarButtonItems = rightBarBtnItemArray;
}

- (NSArray *)pdd_rightBarButtonItems {
    return objc_getAssociatedObject(self, kPddRightBarButtonItemsKey);
}


@end
