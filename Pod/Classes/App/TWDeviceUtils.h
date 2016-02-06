//
//  DeviceUtil.h
//  WeiLib
//
//  Created by Tianwei on 3/6/13.
//  Copyright (c) 2013 Tianwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TWDeviceUtils : NSObject

+(CGFloat)screenHeightWithoutStatusBar;
+(CGFloat)screenHeightWithoutStatusBarAndNavigationBar;

+(CGSize)screenSizeWithoutStatusBar;
+(CGSize)screenSizeWithoutStatusBarAndNavigationBar;

+(CGSize)screenSize;

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
@end
