//
//  UIView+Debug.m
//  note
//
//  Created by xiushanfan on 07/11/2016.
//  Copyright © 2016 xiushanfan. All rights reserved.
//

#import "UIView+Debug.h"
#import  <objc/runtime.h>
#import "UIColor+Colours.h"


static UIView *trackView = nil;
static NSMutableString *level = nil;
static NSMutableString *outputStr = nil;
static NSString *markStr = @"*** ";

static const char *frk_debugModeKey = "frk_viewDebug";

@implementation UIView (Debug)

void frk_swizzle_method(Class class,SEL originSel,SEL targetSel) {
    Method originMethod = class_getInstanceMethod(class, originSel);
    if (originMethod) {
        Method targetMethod = class_getInstanceMethod(class, targetSel);
        //class_addMethod will fail if original method already exists & Ref: http://blog.csdn.net/yiyaaixuexi/article/details/9374411
        BOOL didAddMethod = class_addMethod(class, originSel, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
        if (didAddMethod) {
            class_replaceMethod(class, targetSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        } else {
            method_exchangeImplementations(originMethod, targetMethod);
        }
    } else {
        NSLog(@"frk_swizzle_method failed. cause origin method is nil");
    }
}

+ (void)initialize {
    //Warning you should not swizzle 'description' method, this will cause critical bug.
//    SEL originSel = NSSelectorFromString(@"debugDescription");
//    SEL targetSel = NSSelectorFromString(@"frk_description");
//    frk_swizzle_method([self class], originSel, targetSel);
}

- (void)setFrk_debugMode:(BOOL)frk_debugMode {
    NSNumber *debugNum = [NSNumber numberWithBool:frk_debugMode];
    [self frk_rescureChangeViewBGColor:self];
    objc_setAssociatedObject(self, frk_debugModeKey, debugNum, OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)frk_debugMode {
    NSNumber *debugNum = objc_getAssociatedObject(self, frk_debugModeKey);
    return [debugNum boolValue];
}

- (UIView *)frk_rescureChangeViewBGColor:(UIView *)tview
{
    if (tview.subviews.count > 0) {
        for (UIView *tsView in tview.subviews) {
            tsView.backgroundColor = [UIColor randomColor];
            trackView = [self frk_rescureChangeViewBGColor:tsView];
        }
    } else {
        if (trackView == tview) {
            return nil;
        } else {
            return tview;
        }
    }
    return nil;
}

- (NSString *)frk_description {
    //When you print outputStr,something exception.
    outputStr = [NSMutableString stringWithCapacity:0];
    level = [NSMutableString stringWithCapacity:0];
    [self frk_rescureView:self];
    [outputStr appendString:@"\n Below is origin description \n"];
    [outputStr appendString:[self description]];
    return outputStr;
}

- (UIView *)frk_rescureView:(UIView *)tview
{
    if (tview.subviews.count > 0) {
        [level appendString:markStr];
        for (UIView *tsView in tview.subviews) {
            [outputStr appendFormat:@"\n%@ %@",level, tsView];
            trackView = [self frk_rescureView:tsView];
        }
        [level deleteCharactersInRange:NSMakeRange(level.length - markStr.length, markStr.length)];
    } else {
        if (trackView == tview) {
            return nil;
        } else {
            return tview;
        }
    }
    return nil;
}


@end
