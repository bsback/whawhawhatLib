//
//  NSString+Whawhawhat.m
//  WeiLib
//
//  Created by Tianwei on 14-9-29.
//  Copyright (c) 2014年 whawhawhat. All rights reserved.
//

#import "NSString+Whawhawhat.h"
#import <CommonCrypto/CommonDigest.h>  

@implementation NSString (Whawhawhat)

-(NSData *)UTF8Data{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

-(NSString *)decodeGB2312{
    return [self stringByReplacingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
}

-(NSString *)MD5{
     const char *cStr = [self UTF8String];
     unsigned char digest[16];
     CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
     
     NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
     
     for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
          [output appendFormat:@"%02x", digest[i]];
     
     return  output;
}

-(NSString *)encodeURL{
     CFStringRef newString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+@,/?#[]"), kCFStringEncodingUTF8);
     return (NSString *)CFBridgingRelease(newString);
}

-(NSDictionary *)jsonDictionary{
     NSError* error;
     NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:self.UTF8Data options:kNilOptions error:&error];
     if (!error) {
          return jsonData;
     }else{
          return nil;
     }
}

-(int)zifuLength{
    NSString *str = self;
    int strlength = 0;
    char* p = (char*)[str cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[str lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

-(BOOL)validateEmail{
    NSString *inputText = self;
    NSString *emailRegex = @"[A-Z0-9a-z][A-Z0-9a-z._%+-]*@[A-Za-z0-9][A-Za-z0-9.-]*\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSRange aRange;
    if([emailTest evaluateWithObject:inputText]) {
        aRange = [inputText rangeOfString:@"." options:NSBackwardsSearch range:NSMakeRange(0, [inputText length])];
        int indexOfDot = aRange.location;
        //NSLog(@"aRange.location:%d - %d",aRange.location, indexOfDot);
        if(aRange.location != NSNotFound) {
            NSString *topLevelDomain = [inputText substringFromIndex:indexOfDot];
            topLevelDomain = [topLevelDomain lowercaseString];
            //NSLog(@"topleveldomains:%@",topLevelDomain);
            NSSet *TLD;
            TLD = [NSSet setWithObjects:@".aero", @".asia", @".biz", @".cat", @".com", @".coop", @".edu", @".gov", @".info", @".int", @".jobs", @".mil", @".mobi", @".museum", @".name", @".net", @".org", @".pro", @".tel", @".travel", @".ac", @".ad", @".ae", @".af", @".ag", @".ai", @".al", @".am", @".an", @".ao", @".aq", @".ar", @".as", @".at", @".au", @".aw", @".ax", @".az", @".ba", @".bb", @".bd", @".be", @".bf", @".bg", @".bh", @".bi", @".bj", @".bm", @".bn", @".bo", @".br", @".bs", @".bt", @".bv", @".bw", @".by", @".bz", @".ca", @".cc", @".cd", @".cf", @".cg", @".ch", @".ci", @".ck", @".cl", @".cm", @".cn", @".co", @".cr", @".cu", @".cv", @".cx", @".cy", @".cz", @".de", @".dj", @".dk", @".dm", @".do", @".dz", @".ec", @".ee", @".eg", @".er", @".es", @".et", @".eu", @".fi", @".fj", @".fk", @".fm", @".fo", @".fr", @".ga", @".gb", @".gd", @".ge", @".gf", @".gg", @".gh", @".gi", @".gl", @".gm", @".gn", @".gp", @".gq", @".gr", @".gs", @".gt", @".gu", @".gw", @".gy", @".hk", @".hm", @".hn", @".hr", @".ht", @".hu", @".id", @".ie", @" No", @".il", @".im", @".in", @".io", @".iq", @".ir", @".is", @".it", @".je", @".jm", @".jo", @".jp", @".ke", @".kg", @".kh", @".ki", @".km", @".kn", @".kp", @".kr", @".kw", @".ky", @".kz", @".la", @".lb", @".lc", @".li", @".lk", @".lr", @".ls", @".lt", @".lu", @".lv", @".ly", @".ma", @".mc", @".md", @".me", @".mg", @".mh", @".mk", @".ml", @".mm", @".mn", @".mo", @".mp", @".mq", @".mr", @".ms", @".mt", @".mu", @".mv", @".mw", @".mx", @".my", @".mz", @".na", @".nc", @".ne", @".nf", @".ng", @".ni", @".nl", @".no", @".np", @".nr", @".nu", @".nz", @".om", @".pa", @".pe", @".pf", @".pg", @".ph", @".pk", @".pl", @".pm", @".pn", @".pr", @".ps", @".pt", @".pw", @".py", @".qa", @".re", @".ro", @".rs", @".ru", @".rw", @".sa", @".sb", @".sc", @".sd", @".se", @".sg", @".sh", @".si", @".sj", @".sk", @".sl", @".sm", @".sn", @".so", @".sr", @".st", @".su", @".sv", @".sy", @".sz", @".tc", @".td", @".tf", @".tg", @".th", @".tj", @".tk", @".tl", @".tm", @".tn", @".to", @".tp", @".tr", @".tt", @".tv", @".tw", @".tz", @".ua", @".ug", @".uk", @".us", @".uy", @".uz", @".va", @".vc", @".ve", @".vg", @".vi", @".vn", @".vu", @".wf", @".ws", @".ye", @".yt", @".za", @".zm", @".zw", nil];
            if(topLevelDomain != nil && ([TLD containsObject:topLevelDomain])) {
                //NSLog(@"TLD contains topLevelDomain:%@",topLevelDomain);
                return YES;
            }
            /*else {
             NSLog(@"TLD DOEST NOT contains topLevelDomain:%@",topLevelDomain);
             }*/
            
        }
    }
    return NO;
}

-(BOOL)validateMobile{
    NSString *mobile = self;
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

-(BOOL)validateUrl{
    NSString *candidate = self;
    
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

- (BOOL) isAllDigits
{
     NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
     NSRange r = [self rangeOfCharacterFromSet: nonNumbers];
     return r.location == NSNotFound;
}

-(BOOL)validateIDNumber{
    NSString *idnumber = self;
    
    //判断位数
    if ([idnumber length] < 15 ||[idnumber length] > 18) {
        return NO;
    }
    
    NSString *carid = idnumber;
    long lSumQT =0;
    //加权因子
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    //校验码
    unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    
    //将15位身份证号转换成18位
    
    NSMutableString *mString = [NSMutableString stringWithString:idnumber];
    if ([idnumber length] == 15) {
        [mString insertString:@"19" atIndex:6];
        
        long p = 0;
        const char *pid = [mString UTF8String];
        for (int i=0; i<=16; i++)
        {
            p += (pid[i]-48) * R[i];
        }
        
        int o = p%11;
        NSString *string_content = [NSString stringWithFormat:@"%c",sChecker[o]];
        [mString insertString:string_content atIndex:[mString length]];
        carid = mString;
    }
    
    //判断地区码
    NSString * sProvince = [carid substringToIndex:2];
    
    if (![self areaCode:sProvince]) {
        
        return NO;
    }
    
    //判断年月日是否有效
    
    //年份
    int strYear = [[self getStringWithRange:carid Value1:6 Value2:4] intValue];
    //月份
    int strMonth = [[self getStringWithRange:carid Value1:10 Value2:2] intValue];
    //日
    int strDay = [[self getStringWithRange:carid Value1:12 Value2:2] intValue];
    
    
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",strYear,strMonth,strDay]];
    if (date == nil) {
        
        return NO;
    }
    
    const char *PaperId  = [carid UTF8String];
    
    //检验长度
    if( 18 != strlen(PaperId)) return -1;
    //校验数字
    for (int i=0; i<18; i++)
    {
        if ( !isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) )
        {
            return NO;
        }
    }
    //验证最末的校验码
    for (int i=0; i<=16; i++)
    {
        lSumQT += (PaperId[i]-48) * R[i];
    }
    if (sChecker[lSumQT%11] != PaperId[17] )
    {
        return NO;
    }
    
    return YES;
}

/**
 * 功能:获取指定范围的字符串
 * 参数:字符串的开始小标
 * 参数:字符串的结束下标
 */
-(NSString *)getStringWithRange:(NSString *)str Value1:(int)value1 Value2:(int )value2;
{
     return [str substringWithRange:NSMakeRange(value1,value2)];
}
/**
 * 功能:判断是否在地区码内
 * 参数:地区码
 */
-(BOOL)areaCode:(NSString *)code
{
     NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
     [dic setObject:@"北京" forKey:@"11"];
     [dic setObject:@"天津" forKey:@"12"];
     [dic setObject:@"河北" forKey:@"13"];
     [dic setObject:@"山西" forKey:@"14"];
     [dic setObject:@"内蒙古" forKey:@"15"];
     [dic setObject:@"辽宁" forKey:@"21"];
     [dic setObject:@"吉林" forKey:@"22"];
     [dic setObject:@"黑龙江" forKey:@"23"];
     [dic setObject:@"上海" forKey:@"31"];
     [dic setObject:@"江苏" forKey:@"32"];
     [dic setObject:@"浙江" forKey:@"33"];
     [dic setObject:@"安徽" forKey:@"34"];
     [dic setObject:@"福建" forKey:@"35"];
     [dic setObject:@"江西" forKey:@"36"];
     [dic setObject:@"山东" forKey:@"37"];
     [dic setObject:@"河南" forKey:@"41"];
     [dic setObject:@"湖北" forKey:@"42"];
     [dic setObject:@"湖南" forKey:@"43"];
     [dic setObject:@"广东" forKey:@"44"];
     [dic setObject:@"广西" forKey:@"45"];
     [dic setObject:@"海南" forKey:@"46"];
     [dic setObject:@"重庆" forKey:@"50"];
     [dic setObject:@"四川" forKey:@"51"];
     [dic setObject:@"贵州" forKey:@"52"];
     [dic setObject:@"云南" forKey:@"53"];
     [dic setObject:@"西藏" forKey:@"54"];
     [dic setObject:@"陕西" forKey:@"61"];
     [dic setObject:@"甘肃" forKey:@"62"];
     [dic setObject:@"青海" forKey:@"63"];
     [dic setObject:@"宁夏" forKey:@"64"];
     [dic setObject:@"新疆" forKey:@"65"];
     [dic setObject:@"台湾" forKey:@"71"];
     [dic setObject:@"香港" forKey:@"81"];
     [dic setObject:@"澳门" forKey:@"82"];
     [dic setObject:@"国外" forKey:@"91"];
     
     if ([dic objectForKey:code] == nil) {
          
          return NO;
     }
     return YES;
}

-(BOOL)validateCarNo{
    NSString *n = self;
    
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:n];
}


-(NSMutableArray *)imgURLs{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(<img\\s[\\s\\S]*?src\\s*?=\\s*?['\"](.*?)['\"][\\s\\S]*?>)+?"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    [regex enumerateMatchesInString:self
                            options:0
                              range:NSMakeRange(0, [self length])
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                             
                             NSString *img = [self substringWithRange:[result rangeAtIndex:2]];
                             [arr addObject:img];
                         }];
    
    return arr;
}

-(NSString *)removeHtmlTags{
    NSRange r;
    NSString *tempStr = self;
    while ((r = [tempStr rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        tempStr = [tempStr stringByReplacingCharactersInRange:r withString:@""];
    return tempStr;
}

/*
 URL
 */
-(NSString *)urlParameterForKey:(NSString *)key{
    @try {
        NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[NSURL URLWithString:self] resolvingAgainstBaseURL:NO];
        NSArray *queryItems = urlComponents.queryItems;
        NSString *param = [self valueForKey:key fromQueryItems:queryItems];
        return param;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return nil;
}

- (NSString *)valueForKey:(NSString *)key
           fromQueryItems:(NSArray *)queryItems
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@", key];
    NSURLQueryItem *queryItem = [[queryItems
                                  filteredArrayUsingPredicate:predicate]
                                 firstObject];
    return queryItem.value;
}


-(NSMutableAttributedString *)attributedStringWithFont:(UIFont *)font{
    return [self attributedStringWithFont:font textAlignment:NSTextAlignmentLeft];
}

-(NSMutableAttributedString *)attributedStringWithFont:(UIFont *)font textAlignment:(NSTextAlignment)a{
    return [self attributedStringWithFont:font textAlignment:a lineSpace:3];
}

-(NSMutableAttributedString *)attributedStringWithFont:(UIFont *)font textAlignment:(NSTextAlignment)a lineSpace:(CGFloat)space{
    NSString *str = self;

    NSDictionary *subAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
                              font, NSFontAttributeName, nil];
    
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:str
                                           attributes:subAttrs];
    
    if ([str containsString:@"<sup>"]) {
        
    }
    
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    paragrahStyle.alignment = a;
    [paragrahStyle setLineSpacing:space];
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0,str.length)];
    
    return attributedText;
}

-(CGFloat)attributedHeightWithFont:(UIFont *)font forWidth:(CGFloat)w{
    return [self attributedHeightWithFont:font forWidth:w textAlignment:NSTextAlignmentLeft];
}

-(CGFloat)attributedHeightWithFont:(UIFont *)font forWidth:(CGFloat)w textAlignment:(NSTextAlignment)a{
    NSAttributedString *str = [self attributedStringWithFont:font textAlignment:a];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size.height;
}

-(CGSize)attributedSizeWithFont:(UIFont *)font forWidth:(CGFloat)w textAlignment:(NSTextAlignment)a{
    NSAttributedString *str = [self attributedStringWithFont:font textAlignment:a];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size;
}

-(CGSize)attributedSizeWithFont:(UIFont *)font{
    NSAttributedString *str = [self attributedStringWithFont:font];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size;
}

@end
