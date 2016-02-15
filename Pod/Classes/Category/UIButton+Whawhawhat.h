//
//  UIButton+Whawhawhat.h
//  whawhawhatLib
//
//  Created by Tianwei on 15/4/19.
//  Copyright (c) 2015年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Whawhawhat)

//typedef enum {
//    ButtonIconPositionRight,
//    ButtonIconPositionLeft,
//} ButtonIconPosition;

-(void)setCornerRadius:(CGFloat)radius;
-(void)setBorderColor:(UIColor *)color borderWidth:(CGFloat)width;

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

-(void)setFont:(UIFont *)font;
-(void)setTitle:(NSString *)title;
-(void)setTitleColor:(UIColor *)color;

//-(void)_setFont:(UIFont *)font;
//-(UIFont *)_font;
//
//-(void)_setTitleColor:(UIColor *)color;
//-(UIColor *)_titleColor;
//
//-(void)_setTitle:(NSString *)str;
//-(NSString *)_title;
//
//-(void)_setGap:(CGFloat)g;
//-(CGFloat)_gap;
//
//-(void)_setIcon:(UIImage *)iconImage position:(ButtonIconPosition)position;
//
//-(CGFloat)_contentWidth;
//-(CGFloat)_textWidth;
//
//-(UILabel *)iconLabel;
//-(UIImageView *)iconImageView;

-(CGFloat)contentWidth;
@end
