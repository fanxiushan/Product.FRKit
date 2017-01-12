//
//  FRBarButtonItem.h
//  FRKit
//
//  Created by xiushanfan on 10/01/2017.
//  Copyright © 2017 Smartisan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BarBtnItemTapBlock)(UIBarButtonItem *);

@interface FRBarButtonItem : UIBarButtonItem

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target tapBlock:(BarBtnItemTapBlock)tBarBtnItemTapBlock;

@end
