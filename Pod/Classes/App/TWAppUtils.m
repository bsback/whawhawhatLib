//
//  AppUtils.m
//  WeiLib
//
//  Created by Tianwei on 1/26/14.
//  Copyright (c) 2014 Tianwei. All rights reserved.
//

#import "TWAppUtils.h"
#import <UIKit/UIKit.h>

@implementation TWAppUtils

+(NSString *)appVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return version;
}

+(void)openBrowserWithUrl:(NSString *)url{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
