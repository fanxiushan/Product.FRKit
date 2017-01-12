//
//  UINavigationItem+Position.h
//  note
//
//  Created by xiushanfan on 12/01/2017.
//  Copyright © 2017 smartisan. All rights reserved.
//

#import <UIKit/UIKit.h>

//Note default navigation item don't support set navigation barButtomItem's frame.
//This category make a middle layer to support reposion navigation items

@interface UINavigationItem (Position)

@property (nonatomic, strong) NSArray *pdd_leftBarButtonItems;
@property (nonatomic, strong) NSArray *pdd_rightBarButtonItems;


@end
