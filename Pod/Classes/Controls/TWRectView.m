//
//  TWRectView.m
//  WeiLib
//
//  Created by Tianwei on 3/30/13.
//  Copyright (c) 2013 Tianwei. All rights reserved.
//

#import "TWRectView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TWRectView
@synthesize fillColor,borderColor,borderWeight,radius;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setOpaque:NO];
    }
    return self;
}

+(TWRectView *)rectViewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor{
    TWRectView *v = [[TWRectView alloc] initWithFrame:r];
    v.fillColor = fillColor;
    [v setNeedsDisplay];
    return v;
}

+(TWRectView *)rectViewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor{
    TWRectView *v = [[TWRectView alloc] initWithFrame:r];
    v.fillColor = fillColor;
    v.borderColor = borderColor;
    [v setNeedsDisplay];
    return v;
}

+(TWRectView *)rectViewWithFrame:(CGRect)r fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor borderWeight:(CGFloat)borderWeight radius:(CGFloat)radius{
    TWRectView *v = [[TWRectView alloc] initWithFrame:r];
    v.fillColor = fillColor;
    v.borderColor = borderColor;
    v.radius = radius;
    v.borderWeight = borderWeight;
    [v setNeedsDisplay];
    return v;
}

- (void)drawRect:(CGRect)rect
{
    if (borderColor && radius==0) {
        [fillColor setFill];
        UIRectFill(self.bounds);
        
        CGRect r1 = CGRectMake(0, 0, self.bounds.size.width, 1);//top
        CGRect r2 = CGRectMake(self.bounds.size.width-1, 0, 1, self.bounds.size.height);//r
        CGRect r3 = CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 1);//b
        CGRect r4 = CGRectMake(0, 0, 1, self.bounds.size.height);//l
        
        [borderColor setFill];
        UIRectFill(r1);
        UIRectFill(r2);
        UIRectFill(r3);
        UIRectFill(r4);
    }else if(borderColor && radius>0){
        UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                    byRoundingCorners:UIRectCornerAllCorners
                                                          cornerRadii:CGSizeMake(radius, radius)];
        
        [fillColor setFill];
        [borderColor setStroke];
        [aPath setLineWidth:borderWeight];
        [aPath fill];
        [aPath stroke];
    }else{
        [fillColor setFill];
        UIRectFill(self.bounds);
    }
}

@end
