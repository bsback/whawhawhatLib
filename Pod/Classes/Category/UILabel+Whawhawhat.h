//
//  UILabel+Whawhawhat.h
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Whawhawhat)

-(void)setGradientColorByImage:(UIImage *)img stretchImage:(BOOL)b;
-(void)setGradientColorByImage:(UIImage *)img stretchImage:(BOOL)b applyToHighlight:(BOOL)a;

-(void)setShadowWithOffsetX:(CGFloat)ox andOffsetY:(CGFloat)oy;
-(void)setShadowWithOffsetX:(CGFloat)ox andOffsetY:(CGFloat)oy shadowColor:(UIColor *)c;

//计算左对齐label内容最右边坐标
-(CGFloat)rightPositionOfContent;
-(CGFloat)leftPositionOfContent;

-(void)addToView:(UIView *)v frame:(CGRect)r color:(UIColor *)c font:(UIFont *)f;

-(CGSize)tw_textSize;
@end
