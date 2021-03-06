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

static NSInteger trackRescureLevel = 0;
static const NSInteger rescureLevel = 2;

//not 'static const char *  frk_debugModeKey' & note 修饰顺序.
static char * const frk_debugModeKey = "frk_viewDebug";
static char * const observerFrameContext = "observerFrameContext";


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
    [self frk_rescurePrintViewFrame:self];
    trackRescureLevel = 0;
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:observerFrameContext];
    objc_setAssociatedObject(self, frk_debugModeKey, debugNum, OBJC_ASSOCIATION_RETAIN);
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context {
    //Won't the view addObserver again.
    NSLog(@"UIView (Debug) keyPath = %@, object = %@, change = %@",keyPath,object,change);
    CGRect rect1 = ((NSValue *)[change objectForKey:@"old"]).CGRectValue;
    CGRect rect2 = ((NSValue *)[change objectForKey:@"new"]).CGRectValue;
    if (NO == (CGRectContainsRect(rect1, rect2) && CGRectContainsRect(rect2, rect1))) {
        [self frk_rescurePrintViewFrame:self];
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (self.observationInfo && (newSuperview == nil)) {
        NSString *pointer = [NSString stringWithFormat:@"%p",observerFrameContext];
        NSString *obserVationInfo = [NSString stringWithFormat:@"%@",self.observationInfo];
        NSRange range = [obserVationInfo rangeOfString:pointer];
        if (range.length > 0) {
            [self  removeObserver:self forKeyPath:@"frame" context:observerFrameContext];
        }
    }
}

- (BOOL)frk_debugMode {
    NSNumber *debugNum = objc_getAssociatedObject(self, frk_debugModeKey);
    return [debugNum boolValue];
}

- (void)frk_rescureChangeViewBGColor:(UIView *)tview {
    if (tview.subviews.count > 0) {
        for (UIView *tsView in tview.subviews) {
            tsView.backgroundColor = [UIColor randomColor];
            [self frk_rescureChangeViewBGColor:tsView];
        }
        tview.backgroundColor = [UIColor randomColor];
    }
}

- (void)frk_rescurePrintViewFrame:(UIView *)tview {
    if (trackRescureLevel > rescureLevel) {
        return;
    }
    trackRescureLevel++;
    if (tview.subviews.count > 0) {
        for (UIView *tsView in tview.subviews) {
            [self frk_rescurePrintViewFrame:tsView];
            [tsView addSubview:[self debugLabelWithText:NSStringFromCGRect(tsView.frame)]];
        }
        [tview addSubview:[self debugLabelWithText:NSStringFromCGRect(tview.frame)]];
    }
}

- (UILabel *)debugLabelWithText:(NSString *)tText {
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    testLabel.font = [UIFont systemFontOfSize:8.0f];
    testLabel.backgroundColor = [UIColor whiteColor];
    testLabel.text = tText;
    [testLabel sizeToFit];
    return testLabel;
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


