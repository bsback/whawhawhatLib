//
//  UIButton+Whawhawhat.m
//  whawhawhatLib
//
//  Created by Tianwei on 15/4/19.
//  Copyright (c) 2015年 whawhawhat. All rights reserved.
//

#import "UIButton+Whawhawhat.h"
#import "UIColor+Whawhawhat.h"
#import <objc/runtime.h>
#import "UIView+Whawhawhat.h"
#import "UIImage+Whawhawhat.h"
#import "UILabel+Whawhawhat.h"

static char buttonTextKey;
static char buttonIconKey;
static char buttonFontKey;
static char buttonColorKey;
static char gapKey;
static char iconPositionKey;

@implementation UIButton (Whawhawhat)

#define TAG_ICON    100
#define TAG_LABEL   101

-(void)setCornerRadius:(CGFloat)radius{
    self.layer.cornerRadius=radius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderColor:(UIColor *)color borderWidth:(CGFloat)width{
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:color.CGColor];
}

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state{
    [self setBackgroundImage:color.image forState:state];
}

//-(void)_setFont:(UIFont *)font{
//    objc_setAssociatedObject(self, &buttonFontKey,font, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    self.titleLabel.font = font;
//    if ([self _iconImageView]) {
//        [self refreshLayout];
//    }
//    [self refreshLayout];
//}
//
//-(UIFont *)_font{
//    return objc_getAssociatedObject(self, &buttonFontKey);
//}
//
//-(void)_setGap:(CGFloat)g{
//    objc_setAssociatedObject(self, &gapKey,@(g), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    [self refreshLayout];
//}
//
//-(CGFloat)_gap{
//    return [objc_getAssociatedObject(self, &gapKey) floatValue];
//}
//
//-(void)_setTitleColor:(UIColor *)color{
//    objc_setAssociatedObject(self, &buttonColorKey,color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    [self setTitleColor:color forState:UIControlStateNormal];
//    if ([self _iconImageView]) {
//        [self refreshLayout];
//    }
//}
//
//-(UIColor *)_titleColor{
//    return objc_getAssociatedObject(self, &buttonColorKey);
//}
//
//-(void)_setTitle:(NSString *)str{
//    objc_setAssociatedObject(self, &buttonTextKey,str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    if ([self _iconImageView] ) {
//        [self refreshLayout];
//        [self setTitle:@"" forState:UIControlStateNormal];
//    }else{
//        [self setTitle:str forState:UIControlStateNormal];
//    }
//}
//
//-(NSString *)_title{
//    return objc_getAssociatedObject(self, &buttonTextKey);
//}
//
//-(UILabel *)_iconLabel{
//    UILabel *label = (UILabel *)[self viewWithTag:TAG_LABEL];
//    return label;
//}
//
//-(UIImageView *)_iconImageView{
//    UIImageView *imageView = (UIImageView *)[self viewWithTag:TAG_ICON];
//    return imageView;
//}
//
//-(void)_setIcon:(UIImage *)iconImage position:(ButtonIconPosition)position{
//    UIImageView *iconImageView = [self _iconImageView];
//    if (!iconImageView) {
//        iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, iconImage.width, iconImage.height)];
//        iconImageView.tag = TAG_ICON;
//    }
//    iconImageView.image = iconImage;
//    [self addSubview:iconImageView];
//    
//    [self _setButtonIconPosition:position];
//}
//
//-(void)_setButtonIconPosition:(ButtonIconPosition)position{
//    objc_setAssociatedObject(self, &iconPositionKey,@(position), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    [self refreshLayout];
//}
//
//- (ButtonIconPosition) _buttonIconPosition {
//    return [objc_getAssociatedObject(self, &iconPositionKey) intValue];
//}

//-(CGFloat)_textWidth{
//    NSDictionary *subAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
//                              [self _font], NSFontAttributeName, nil];
//    
//    NSMutableAttributedString *attributedText =
//    [[NSMutableAttributedString alloc] initWithString:self._title
//                                           attributes:subAttrs];
//    
//    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
//    
//    CGFloat w = rect.size.width;
//    
//    return w;
//}
//
//-(CGFloat)_contentWidth{
//    CGFloat w = [self _textWidth];
//    if ([self _iconImageView]) {
//        w += self._gap + [self _iconImageView].width;
//    }
//    
//    return w;
//}

//-(void)refreshLayout{
//    if ([self _iconImageView]) {
//        if (!self._titleColor) {
//            [self _setTitleColor:[UIColor blackColor]];
//        }
//        if (![self _font]) {
//            [self _setFont:[UIFont systemFontOfSize:14.0f]];
//        }
//        if (!self._title) {
//            [self _setTitle:@""];
//        }
//        
//        UILabel *label = [self _iconLabel];
//        if (!label) {
//            label = [[UILabel alloc] init];
//            [label addToView:self frame:self.bounds color:[self _titleColor] font:[self _font]];
//        }
//        label.textColor = self._titleColor;
//        label.font = [self _font];
//        label.text = [self _title];
//        label.width = [self _textWidth];
//        
//        UIImageView *iconImageView = [self _iconImageView];
//        ButtonIconPosition position = [self _buttonIconPosition];
//        
//        label.height = self.height;
//        iconImageView.y = roundf(0.5f*(self.height - iconImageView.height));
//        
//        CGFloat w = [self _contentWidth];
//        CGFloat offset = roundf(0.5f*(self.width - w));
//        if (position == ButtonIconPositionLeft) {
//            iconImageView.x = offset;
//            label.x = iconImageView.right + self._gap;
//        }else{
//            label.x = offset;
//            iconImageView.x = label.right + self._gap;
//        }
//    }
//}

-(CGFloat)contentWidth{
    @try {
        NSDictionary *subAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
                                  self.titleLabel.font, NSFontAttributeName, nil];
        
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:self.titleLabel.text
                                               attributes:subAttrs];
        
        CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        
        CGFloat w = rect.size.width;
        
        return w;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
    return 0;
}

-(void)setFont:(UIFont *)font{
    self.titleLabel.font  =font;
}

-(void)setTitleColor:(UIColor *)color{
    [self setTitleColor:color forState:UIControlStateNormal];
}

-(void)setTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}
@end
