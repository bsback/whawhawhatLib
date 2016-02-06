//
//  UINavigationController+Whawhawhat.h
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Whawhawhat)

-(void)removeViewControllerOfClasses:(NSArray *)arr;

+(UINavigationController *)customizedNavigationControllerWithBackgroundImage:(NSString *)imageName;
+(UINavigationController *)customizedNavigationControllerWithBackgroundStretchImage:(UIImage *)image;
@end
