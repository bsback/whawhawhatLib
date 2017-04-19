//
//  TWView.h
//  whawhawhatLib
//
//  Created by Tianwei on 15/3/11.
//  Copyright (c) 2015年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWView : UIView{
    UIColor *_fillColor;
    UIColor *_borderColor;
    CGFloat _borderWidth;
    CGFloat _cornerRadius;
    
    CGFloat _cornerTopLeft;
    CGFloat _cornerTopRight;
    CGFloat _cornerBottomLeft;
    CGFloat _cornerBottomRight;
}

+(TWView*)viewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;

- (void)setFillColor:(UIColor *)c;
- (void)setBorderColor:(UIColor *)c;
- (void)setBorderWidth:(CGFloat)val;
- (void)setCornerRadius:(CGFloat)val;

-(void)setCornerRadiusTopLeft:(CGFloat)tl topRight:(CGFloat)tr bottomRight:(CGFloat)br bottomLeft:(CGFloat)bl;

+(CGFloat)viewHeight;
+(CGFloat)viewWidth;
+(CGSize)viewSize;
@end
