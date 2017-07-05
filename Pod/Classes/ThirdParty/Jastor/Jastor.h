//
//  Jastor.h
//  Jastor
//
//  Created by Elad Ossadon on 12/14/11.
//  http://devign.me | http://elad.ossadon.com | http://twitter.com/elado
//
#import <UIKit/UIKit.h>

@interface Jastor : NSObject <NSCoding>

@property BOOL boolFlag;

@property (nonatomic, copy) NSString *objectId;
+ (id)objectFromDictionary:(NSDictionary*)dictionary;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (id)initWithString:(NSString *)str;

- (NSMutableDictionary *)toDictionary;
- (NSString *)jsonString;
@end
