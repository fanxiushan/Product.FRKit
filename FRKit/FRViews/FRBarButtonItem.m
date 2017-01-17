//
//  FRBarButtonItem.m
//  FRKit
//
//  Created by xiushanfan on 10/01/2017.
//  Copyright © 2017 frank. All rights reserved.
//

#import "FRBarButtonItem.h"

@interface FRBarButtonItem() {
    BarBtnItemTapBlock barBtnItemTapBlock;
}

@end

@implementation FRBarButtonItem

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target tapBlock:(BarBtnItemTapBlock)tBarBtnItemTapBlock {
    self = [super initWithTitle:title style:style target:self action:@selector(tapBarBtn:)];
    if (self) {
        barBtnItemTapBlock = [tBarBtnItemTapBlock copy];
    }
    return self;
}

- (void)tapBarBtn:(UIBarButtonItem *)tBarBtnItem {
    barBtnItemTapBlock(tBarBtnItem);
}

@end
