//
//  FRKAlertView.m
//  FRKit
//
//  Created by xiushanfan on 09/01/2017.
//  Copyright © 2017 frk. All rights reserved.
//

#import "FRKAlertView.h"

@interface FRKAlertView()<UIAlertViewDelegate> {
    FRAVCancelTapBlock cancelTapBlock;
    NSArray * otherTapBlocks;
}

@end

@implementation FRKAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,... {
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self) {
        return self;
    }
    return nil;
}

- (void)setCancelBlock:(FRAVCancelTapBlock)tCancelTapBlock otherBlocks:(NSArray *)tOtherTapBlocks {
    cancelTapBlock = [tCancelTapBlock copy];
    otherTapBlocks = [tOtherTapBlocks copy];
}


#pragma mark - UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    FRAVOtherTapBlock otherTapBlock = [otherTapBlocks objectAtIndex:buttonIndex];
    otherTapBlock();
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    cancelTapBlock();
}


@end

