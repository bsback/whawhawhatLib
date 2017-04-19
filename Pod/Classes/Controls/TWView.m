//
//  TWView.m
//  whawhawhatLib
//
//  Created by Tianwei on 15/3/11.
//  Copyright (c) 2015年 whawhawhat. All rights reserved.
//

#import "TWView.h"

@implementation TWView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setOpaque:NO];
    }
    return self;
}

+(TWView *)viewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius{
    TWView *view = [[TWView alloc] initWithFrame:r];
    [view setFillColor:fillColor];
    [view setBorderColor:borderColor];
    [view setBorderWidth:borderWidth];
    [view setCornerRadius:cornerRadius];
    
    return view;
}

- (void)setFillColor:(UIColor *)c{
    _fillColor = c;
    [self setNeedsDisplay];
}

- (void)setBorderColor:(UIColor *)c{
    _borderColor = c;
    [self setNeedsDisplay];
}

- (void)setBorderWidth:(CGFloat)val{
    _borderWidth = val;
    [self setNeedsDisplay];
}

- (void)setCornerRadius:(CGFloat)val{
    _cornerRadius = val;
    [self setNeedsDisplay];
}

-(void)setCornerRadiusTopLeft:(CGFloat)tl topRight:(CGFloat)tr bottomRight:(CGFloat)br bottomLeft:(CGFloat)bl{
    _cornerTopLeft = tl;
    _cornerTopRight = tr;
    _cornerBottomLeft = bl;
    _cornerBottomRight = br;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, _borderWidth, _borderWidth) cornerRadius:_cornerRadius];
    if (_cornerTopLeft!=0 || _cornerTopRight!=0 || _cornerBottomRight!=0 ||_cornerBottomLeft!=0) {
        UIRectCorner corner = 0;
        CGFloat cornerSize = 0;
        if (_cornerTopLeft!=0) {
            corner = corner | UIRectCornerTopLeft;
            cornerSize = _cornerTopLeft;
        }
        if (_cornerTopRight!=0) {
            corner = corner | UIRectCornerTopRight;
            cornerSize = _cornerTopRight;
        }
        if (_cornerBottomLeft!=0) {
            corner = corner | UIRectCornerBottomLeft;
            cornerSize = _cornerBottomLeft;
        }
        if (_cornerBottomRight!=0) {
            corner = corner | UIRectCornerBottomRight;
            cornerSize = _cornerBottomRight;
        }
        bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, _borderWidth, _borderWidth) byRoundingCorners:corner cornerRadii:CGSizeMake(cornerSize, cornerSize)];
    }
    CGPathRef path = bezierPath.CGPath;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [_fillColor setFill];
    [_borderColor setStroke];
    
    CGContextSetLineWidth(ctx, _borderWidth);
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
//    CGPathRelease(path);
}

+(CGFloat)viewHeight{
    return 0;
}

+(CGFloat)viewWidth{
    return 0;
}

+(CGSize)viewSize{
    return CGSizeMake([[self class] viewWidth], [[self class] viewHeight]);
}
@end
