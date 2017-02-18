//
//  NSString+Whawhawhat.h
//  WeiLib
//
//  Created by Tianwei on 14-9-29.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import <UIKit/UIKit.h>

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
-(NSString *)removeHtmlTags;

/*
 URL
 */
-(NSString *)urlParameterForKey:(NSString *)key;

-(NSMutableAttributedString *)attributedStringWithFont:(UIFont *)font;
-(CGFloat)attributedHeightWithFont:(UIFont *)font forWidth:(CGFloat)w;

-(NSMutableAttributedString *)attributedStringWithFont:(UIFont *)font textAlignment:(NSTextAlignment)a;
-(NSMutableAttributedString *)attributedStringWithFont:(UIFont *)font textAlignment:(NSTextAlignment)a lineSpace:(CGFloat)space;
-(CGFloat)attributedHeightWithFont:(UIFont *)font forWidth:(CGFloat)w textAlignment:(NSTextAlignment)a;
-(CGSize)attributedSizeWithFont:(UIFont *)font forWidth:(CGFloat)w textAlignment:(NSTextAlignment)a;
-(CGSize)attributedSizeWithFont:(UIFont *)font;

+(CGSize)attributedSizeWithString:(NSAttributedString *)str forWidth:(CGFloat)w;
@end
