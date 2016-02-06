//
//  AppUtils.h
//  WeiLib
//
//  Created by Tianwei on 1/26/14.
//  Copyright (c) 2014 Tianwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWAppUtils : NSObject

+(NSString *)appVersion;
+(void)openBrowserWithUrl:(NSString *)url;
@end
