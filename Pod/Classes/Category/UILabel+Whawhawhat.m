//
//  UILabel+Whawhawhat.m
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import "UILabel+Whawhawhat.h"
#import "UIImage+Whawhawhat.h"
#import <QuartzCore/QuartzCore.h>
#import "NSString+Whawhawhat.h"

@implementation UILabel (Whawhawhat)

-(void)widthToFit{
    CGSize s = [self.text attributedSizeWithFont:self.font];
    CGRect r = self.frame;
    r.size.width = s.width + 1;
    self.frame = r;
}

-(void)setGradientColorByImage:(UIImage *)img stretchImage:(BOOL)b applyToHighlight:(BOOL)a{
    if (!b) {
        self.textColor = [UIColor colorWithPatternImage:img];
        if (a) {
            self.highlightedTextColor = [UIColor colorWithPatternImage:img];
        }
    }else{
        self.textColor = [UIColor colorWithPatternImage:[img scaledToSize:self.frame.size]];
        if (a) {
            self.highlightedTextColor = [UIColor colorWithPatternImage:[img scaledToSize:self.frame.size]];
        }
    }
}

-(void)setGradientColorByImage:(UIImage *)img stretchImage:(BOOL)b{
    [self setGradientColorByImage:img stretchImage:b applyToHighlight:YES];
}

-(void)setShadowWithOffsetX:(CGFloat)ox andOffsetY:(CGFloat)oy shadowColor:(UIColor *)c{
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowRadius = 1.0;
    self.layer.shadowColor = c.CGColor;
    self.layer.shadowOffset = CGSizeMake(ox, oy);
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

-(void)setShadowWithOffsetX:(CGFloat)ox andOffsetY:(CGFloat)oy{
    [self setShadowWithOffsetX:ox andOffsetY:oy shadowColor:[UIColor blackColor]];
}

-(CGFloat)rightPositionOfContent{
    CGRect r = self.frame;
    CGSize s = [self.text sizeWithFont:self.font];
    return r.origin.x + r.size.width - s.width;
}

-(CGFloat)leftPositionOfContent{
    CGRect r = self.frame;
    CGSize s = [self.text sizeWithFont:self.font];
    return r.origin.x + s.width;
}

-(void)addToView:(UIView *)v frame:(CGRect)r color:(UIColor *)c font:(UIFont *)f{
    self.frame = r;
    self.font = f;
    self.textColor = self.highlightedTextColor = c;
    self.backgroundColor = [UIColor clearColor];
    [v addSubview:self];
}

-(CGSize)tw_textSize{
    @try {
        NSDictionary *subAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
                                  self.font, NSFontAttributeName, nil];
        
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:self.text?self.text:@""
                                               attributes:subAttrs];
        
        CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        
        return rect.size;
    }
    @catch (NSException *exception) {
        return CGSizeZero;
    }
    @finally {
        return CGSizeZero;
    }
    return CGSizeZero;
}
@end
