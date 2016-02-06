//
//  UIView+Whawhawhat.h
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Whawhawhat)

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)newOrigin;
- (CGSize)size;
- (void)setSize:(CGSize)newSize;

- (CGFloat)x;
- (void)setX:(CGFloat)newX;
- (CGFloat)y;
- (void)setY:(CGFloat)newY;

- (CGFloat)height;
- (void)setHeight:(CGFloat)newHeight;
- (CGFloat)width;
- (void)setWidth:(CGFloat)newWidth;

- (CGFloat)bottom;
- (CGFloat)right;

-(void)removeAllSubview;

-(void)addHLineWithColor:(UIColor *)color y:(CGFloat)yPos;
-(void)addHLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos w:(CGFloat)w;
-(void)addVLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos h:(CGFloat)h;

-(void)addHalfHLineWithColor:(UIColor *)color y:(CGFloat)yPos;
-(void)addHalfHLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos w:(CGFloat)w;
-(void)addHalfVLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos h:(CGFloat)h;
@end
