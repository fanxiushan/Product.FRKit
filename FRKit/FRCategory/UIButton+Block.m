//
//  UIButton+Block.m
//  FRKit
//
//  Created by xiushanfan on 11/01/2017.
//  Copyright © 2017 Smartisan. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

@interface UIButton() {
    
}

@end

const char *kTapBlockKey = "kTapBlockKey";

@implementation UIButton (Block)


- (void)setTouchUpSideTapBlock:(BtnTapBlock)btnTapBlock {
    [self addTarget:self action:@selector(block_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(self, kTapBlockKey, nil, OBJC_ASSOCIATION_COPY);  //Clear old association.
    objc_setAssociatedObject(self, kTapBlockKey, btnTapBlock, OBJC_ASSOCIATION_COPY);  //Create new association.
}

- (BtnTapBlock)touchUpSideTapBlock {
    return objc_getAssociatedObject(self, kTapBlockKey);
}

//Note:this method name should not conflict with other action name.
- (void)block_btnPressed:(UIButton *)tBtn {
    if (self.touchUpSideTapBlock) {
        self.touchUpSideTapBlock(tBtn);
    } else {
        NSLog(@"error self.touchUpSideTapBlock is nil");
    }
}

@end
