//
//  UIColor+Whawhawhat.h
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Whawhawhat)
+ (UIColor *)colorWithHexString:(NSString *)hexString;

-(UIImage *)image;
+(UIColor *)randomColor;

- (UIColor *)darkerColor;
- (UIColor *)lighterColor;
@end
