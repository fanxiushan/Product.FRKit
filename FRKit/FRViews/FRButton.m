//
//  FRButton.m
//  FRKit
//
//  Created by xiushanfan on 09/01/2017.
//  Copyright © 2017 Smartisan. All rights reserved.
//

#import "FRButton.h"

@interface FRButton() {
    FRTapBlock tapBlock;
}

@end

@implementation FRButton

- (void)setTouchUpInsideBlock:(FRTapBlock)tTapBlock {
    tapBlock = [tTapBlock copy];
    [self addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnPressed:(UIButton *)btn {
    tapBlock((FRButton *)btn);
}

@end
