//
//  UIView+Whawhawhat.m
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import "UIView+Whawhawhat.h"
#import "TWRectView.h"

@implementation UIView (Whawhawhat)


- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)newOrigin {
    CGRect newFrame = self.frame;
    newFrame.origin = newOrigin;
    self.frame = newFrame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)newSize {
    CGRect newFrame = self.frame;
    newFrame.size = newSize;
    self.frame = newFrame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)newX {
    CGRect newFrame = self.frame;
    newFrame.origin.x = newX;
    self.frame = newFrame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)newY {
    CGRect newFrame = self.frame;
    newFrame.origin.y = newY;
    self.frame = newFrame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newHeight {
    CGRect newFrame = self.frame;
    newFrame.size.height = newHeight;
    self.frame = newFrame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newWidth {
    CGRect newFrame = self.frame;
    newFrame.size.width = newWidth;
    self.frame = newFrame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

-(void)removeAllSubview{
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

-(void)addHLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos w:(CGFloat)w{
    TWRectView *line = [TWRectView rectViewWithFrame:CGRectMake(xPos, yPos, w, 1.0f) fillColor:color];
    [self addSubview:line];
}

-(void)addHLineWithColor:(UIColor *)color y:(CGFloat)yPos{
    [self addHLineWithColor:color x:0 y:yPos w:self.width];
}

-(void)addVLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos h:(CGFloat)h{
    TWRectView *line = [TWRectView rectViewWithFrame:CGRectMake(xPos, yPos, 1.0f,h) fillColor:color];
    [self addSubview:line];
}

-(void)addHalfHLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos w:(CGFloat)w{
    TWRectView *line = [TWRectView rectViewWithFrame:CGRectMake(xPos, yPos, w, 0.5f) fillColor:color];
    [self addSubview:line];
}

-(void)addHalfHLineWithColor:(UIColor *)color y:(CGFloat)yPos{
    [self addHalfHLineWithColor:color x:0 y:yPos w:self.width];
}

-(void)addHalfVLineWithColor:(UIColor *)color x:(CGFloat)xPos y:(CGFloat)yPos h:(CGFloat)h{
    TWRectView *line = [TWRectView rectViewWithFrame:CGRectMake(xPos, yPos, 0.5f,h) fillColor:color];
    [self addSubview:line];
}
@end
