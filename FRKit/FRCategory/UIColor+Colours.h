//
//  UIColor+Colours.h
//  ColoursDemo
//
//  Created by Jesper on 4/4/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>


#define RGB(r,g,b)[UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1]
#define RGBA(r,g,b,a)[UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define HexColor(hexColor) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1]
#define HexColorA(hexColor,a) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:a]

// Color Scheme Creation Enum
typedef enum
{
    ColorSchemeAnalagous = 0,
    ColorSchemeMonochromatic,
    ColorSchemeTriad,
    ColorSchemeComplementary
	
} ColorScheme;

@interface UIColor (Colours)

// Color Methods
+ (UIColor *)colorWithRGBA:(NSUInteger)color;
+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGBAArray:(NSArray *)rgbaArray;
- (NSString *)hexString;
- (NSArray *)rgbaArray;
- (NSArray *)hsbaArray;
- (NSDictionary *)rgbaDict;
- (NSDictionary *)hsbaDict;

// Generate Color Scheme
- (NSArray *)colorSchemeOfType:(ColorScheme)type;

// Contrasting Color
- (UIColor *)blackOrWhiteContrastingColor;

// System Colors
+ (UIColor *)infoBlueColor;
+ (UIColor *)successColor;
+ (UIColor *)warningColor;
+ (UIColor *)dangerColor;

// Whites
+ (UIColor *)antiqueWhiteColor;
+ (UIColor *)oldLaceColor;
+ (UIColor *)ivoryColor;
+ (UIColor *)seashellColor;
+ (UIColor *)ghostWhiteColor;
+ (UIColor *)snowColor;
+ (UIColor *)linenColor;

// Grays
+ (UIColor *)black25PercentColor;
+ (UIColor *)black30PercentColor;
+ (UIColor *)black50PercentColor;
+ (UIColor *)black75PercentColor;
+ (UIColor *)warmGrayColor;
+ (UIColor *)coolGrayColor;
+ (UIColor *)charcoalColor;

// Blues
+ (UIColor *)tealColor;
+ (UIColor *)steelBlueColor;
+ (UIColor *)robinEggColor;
+ (UIColor *)pastelBlueColor;
+ (UIColor *)turquoiseColor;
+ (UIColor *)skyBlueColor;
+ (UIColor *)indigoColor;
+ (UIColor *)denimColor;
+ (UIColor *)blueberryColor;
+ (UIColor *)cornflowerColor;
+ (UIColor *)babyBlueColor;
+ (UIColor *)midnightBlueColor;
+ (UIColor *)fadedBlueColor;
+ (UIColor *)icebergColor;
+ (UIColor *)waveColor;

// Greens
+ (UIColor *)emeraldColor;
+ (UIColor *)grassColor;
+ (UIColor *)pastelGreenColor;
+ (UIColor *)seafoamColor;
+ (UIColor *)paleGreenColor;
+ (UIColor *)cactusGreenColor;
+ (UIColor *)chartreuseColor;
+ (UIColor *)hollyGreenColor;
+ (UIColor *)oliveColor;
+ (UIColor *)oliveDrabColor;
+ (UIColor *)moneyGreenColor;
+ (UIColor *)honeydewColor;
+ (UIColor *)limeColor;
+ (UIColor *)cardTableColor;

// Reds
+ (UIColor *)salmonColor;
+ (UIColor *)brickRedColor;
+ (UIColor *)easterPinkColor;
+ (UIColor *)grapefruitColor;
+ (UIColor *)pinkColor;
+ (UIColor *)indianRedColor;
+ (UIColor *)strawberryColor;
+ (UIColor *)coralColor;
+ (UIColor *)maroonColor;
+ (UIColor *)watermelonColor;
+ (UIColor *)tomatoColor;
+ (UIColor *)pinkLipstickColor;
+ (UIColor *)paleRoseColor;
+ (UIColor *)crimsonColor;

// Purples
+ (UIColor *)eggplantColor;
+ (UIColor *)pastelPurpleColor;
+ (UIColor *)palePurpleColor;
+ (UIColor *)coolPurpleColor;
+ (UIColor *)violetColor;
+ (UIColor *)plumColor;
+ (UIColor *)lavenderColor;
+ (UIColor *)raspberryColor;
+ (UIColor *)fuschiaColor;
+ (UIColor *)grapeColor;
+ (UIColor *)periwinkleColor;
+ (UIColor *)orchidColor;

// Yellows
+ (UIColor *)goldenrodColor;
+ (UIColor *)yellowGreenColor;
+ (UIColor *)bananaColor;
+ (UIColor *)mustardColor;
+ (UIColor *)buttermilkColor;
+ (UIColor *)goldColor;
+ (UIColor *)creamColor;
+ (UIColor *)lightCreamColor;
+ (UIColor *)wheatColor;
+ (UIColor *)beigeColor;

// Oranges
+ (UIColor *)peachColor;
+ (UIColor *)burntOrangeColor;
+ (UIColor *)pastelOrangeColor;
+ (UIColor *)cantaloupeColor;
+ (UIColor *)carrotColor;
+ (UIColor *)mandarinColor;

// Browns
+ (UIColor *)chiliPowderColor;
+ (UIColor *)burntSiennaColor;
+ (UIColor *)chocolateColor;
+ (UIColor *)coffeeColor;
+ (UIColor *)cinnamonColor;
+ (UIColor *)almonColor;
+ (UIColor *)eggshellColor;
+ (UIColor *)sandColor;
+ (UIColor *)mudColor;
+ (UIColor *)siennaColor;
+ (UIColor *)dustColor;


+ (UIColor *)randomColor;
@end