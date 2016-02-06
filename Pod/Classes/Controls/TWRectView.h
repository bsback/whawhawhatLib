//
//  TWRectView.h
//  WeiLib
//
//  Created by Tianwei on 3/30/13.
//  Copyright (c) 2013 Tianwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWRectView : UIView
@property (nonatomic,strong) UIColor *fillColor;
@property (nonatomic,strong) UIColor *borderColor;
@property CGFloat borderWeight;
@property CGFloat radius;

+(TWRectView*)rectViewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor;
+(TWRectView*)rectViewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor;
+(TWRectView*)rectViewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor borderWeight:(CGFloat)borderWeight radius:(CGFloat)radius ;

@end
