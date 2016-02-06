//
//  UIImage+Whawhawhat.m
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import "UIImage+Whawhawhat.h"

@implementation UIImage (Whawhawhat)

-(CGFloat)width{
    return self.size.width;
}

-(CGFloat)height{
    return self.size.height;
}

-(UIImage *)scaledToWidth:(float)i_width{
    if (self.size.width <= i_width) {
        return self;
    }
    
    float oldWidth = self.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = self.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [self drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(UIImage *)scaledToSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGRect r = CGRectZero;
    r.size = size;
    [self drawInRect:r];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//scale 9 图片
+(UIImage *)scaleNineImageWithImageName:(NSString *)imageName left:(CGFloat)l top:(CGFloat)t{
    return [UIImage scaleNineImageWithImageName:imageName left:l top:t right:l bottom:t];
}

+(UIImage *)scaleNineImageWithImageName:(NSString *)imageName left:(CGFloat)l top:(CGFloat)t right:(CGFloat)r bottom:(CGFloat)b{
    UIImage *img = [UIImage imageNamed:imageName];
    if ([img respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(t, l, b, r);
        img = [img resizableImageWithCapInsets:edgeInsets];
    }else{
        img = [img stretchableImageWithLeftCapWidth:l topCapHeight:t];
    }
    
    return img;
}
@end