//
//  UINavigationController+Whawhawhat.m
//  whawhawhatLib
//
//  Created by Tianwei on 14/11/5.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import "UINavigationController+Whawhawhat.h"
#import "SCNavigationBar.h"

@implementation UINavigationController (Whawhawhat)

-(void)removeViewControllerOfClasses:(NSArray *)arr{
    NSMutableArray *allViewControllers = [NSMutableArray arrayWithArray:self.viewControllers];
    
    NSMutableIndexSet *indexesToDelete = [NSMutableIndexSet indexSet];
    NSUInteger currentIndex = 0;
    
    for (UIViewController *vc in allViewControllers) {
        BOOL found = NO;
        for (Class c in arr) {
            if (vc.class == c) {
                [indexesToDelete addIndex:currentIndex];
                found = YES;
            }
        }
        
        currentIndex++;
    }
    
    [allViewControllers removeObjectsAtIndexes:indexesToDelete];
    
    self.viewControllers = allViewControllers;
}

+(UINavigationController *)customizedNavigationControllerWithBackgroundImage:(NSString *)imageName{
    UINavigationController *navController = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    
    [navController navigationBar];
    
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:navController forKey:@"root"];
    [archiver finishEncoding];
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [unarchiver setClass:[SCNavigationBar class] forClassName:@"UINavigationBar"];
    UINavigationController *customizedNavController = [unarchiver decodeObjectForKey:@"root"];
    [unarchiver finishDecoding];
    
    SCNavigationBar *navBar = (SCNavigationBar *)[customizedNavController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.39 green:0.72 blue:0.62 alpha:1.0]];
    [navBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
    
    return customizedNavController;
}

+(UINavigationController *)customizedNavigationControllerWithBackgroundStretchImage:(UIImage *)image{
    UINavigationController *navController = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    
    [navController navigationBar];
    
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:navController forKey:@"root"];
    [archiver finishEncoding];
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [unarchiver setClass:[SCNavigationBar class] forClassName:@"UINavigationBar"];
    UINavigationController *customizedNavController = [unarchiver decodeObjectForKey:@"root"];
    [unarchiver finishDecoding];
    
    SCNavigationBar *navBar = (SCNavigationBar *)[customizedNavController navigationBar];
    [navBar setTintColor:[UIColor colorWithRed:0.39 green:0.72 blue:0.62 alpha:1.0]];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    return customizedNavController;
}

@end
