//
//  UIView+Debug.h
//  note
//
//  Created by xiushanfan on 07/11/2016.
//  Copyright © 2016 xiushanfan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Debug)

@property (nonatomic, assign) BOOL frk_debugMode;

//Rescure print view with level.
- (NSString *)frk_description;



@end
