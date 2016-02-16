//
//  NSString+Whawhawhat.h
//  WeiLib
//
//  Created by Tianwei on 14-9-29.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Whawhawhat)

-(NSData *)UTF8Data;
-(NSData *)UTF;
-(NSString *)decodeGB2312;
-(NSString *)MD5;
-(NSString *)encodeURL;
-(NSDictionary *)jsonDictionary;

//字符数，汉字两个
-(int)zifuLength;

/*
 VALIDATE
 */
-(BOOL)validateEmail;
-(BOOL)validateMobile;
-(BOOL)validateCarNo;
//身份证
-(BOOL)validateIDNumber;
-(BOOL)validateUrl;

-(BOOL)isAllDigits;

/*
HTML
 */
-(NSMutableArray *)imgURLs;
-(NSString *)removeHtmlTags:(NSString *)str;

/*
 URL
 */
-(NSString *)urlParameterForKey:(NSString *)key;

@end
