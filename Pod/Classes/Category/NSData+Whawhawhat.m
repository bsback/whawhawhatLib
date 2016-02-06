//
//  NSData+Whawhawhat.m
//  WeiLib
//
//  Created by Tianwei on 14-9-29.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import "NSData+Whawhawhat.h"

@implementation NSData (Whawhawhat)

-(NSString *)UTF8String{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

-(NSString *)GB2312String{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *str = [[NSString alloc] initWithData:self encoding:enc];
    return str;
}
@end
