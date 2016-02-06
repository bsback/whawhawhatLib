//
//  DeviceUtil.m
//  WeiLib
//
//  Created by Tianwei on 3/6/13.
//  Copyright (c) 2013 Tianwei. All rights reserved.
//

#import "TWDeviceUtils.h"

@implementation TWDeviceUtils

+(CGSize)screenSize{
    CGSize s = [TWDeviceUtils screenSizeWithoutStatusBar];
    s.height += [UIApplication sharedApplication].statusBarFrame.size.height;
    return s;
}

+(CGSize)screenSizeWithoutStatusBar{
    CGSize viewSize = [[UIScreen mainScreen] bounds].size;
    
    if(UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)){
        viewSize = CGSizeMake(viewSize.height, viewSize.width - [UIApplication sharedApplication].statusBarFrame.size.height);
    } else {
        viewSize = CGSizeMake(viewSize.width, viewSize.height - [UIApplication sharedApplication].statusBarFrame.size.height);
    }
    return viewSize;
}

+(CGFloat)screenHeightWithoutStatusBar{
    return [TWDeviceUtils screenSizeWithoutStatusBar].height;
}

+(CGSize)screenSizeWithoutStatusBarAndNavigationBar{
    CGSize s = [TWDeviceUtils screenSizeWithoutStatusBar];
    s.height -= 44;
    return s;
}

+(CGFloat)screenHeightWithoutStatusBarAndNavigationBar{
    return [TWDeviceUtils screenSizeWithoutStatusBarAndNavigationBar].height;
}
@end
