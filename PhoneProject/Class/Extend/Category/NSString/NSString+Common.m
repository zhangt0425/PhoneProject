//
//  NSString+Common.m
//  PhoneProject
//
//  Created by 涛涛 on 2017/8/21.
//  Copyright © 2017年 张涛. All rights reserved.
//

#import "NSString+Common.h"
#import <CommonCrypto/CommonDigest.h>
#import <objc/runtime.h>

#define __String(fmt, ...)  [NSString stringWithFormat:fmt, ##__VA_ARGS__]

static NSArray *basicClassList;
static NSArray *setClassList;
static inline void initClassList();

static inline NSString *tapString(NSString *string);
static inline NSString *NSStringFromCATransform3D(CATransform3D transform);
static inline NSString *describeBasicClass(NSString *classString,id object);
static inline NSString *describeNSValue(NSValue *value);
static inline NSString *describeSet(NSString *setClass,NSSet *list);
static inline NSString *describeDictionary(NSDictionary *map);
static inline NSString *describeObject(id object);

@implementation NSString (Common)

#pragma mark - 文本国际化
+ (NSString *)stringByDict:(NSDictionary *)dict
{
    NSString *opinion   = [NSLocale preferredLanguages][0];
    NSDictionary *data  = @{
                            @"chs"      : @"chs",
                            @"cht"      : @"cht",
                            @"jp"       : @"jp",
                            @"kr"       : @"kr",
                            @"zh-Hans"  : @"chs",
                            @"zh-Hant"  : @"cht",
                            @"ja"       : @"jp",
                            @"ko"       : @"kr",
                            };
    
    // 不满足以上整合的语种，则全部默认为 en 英文
    NSString *language= data[opinion] ? data[opinion] : @"en";
    NSString *text      = dict[language];
    
    if (text && [text respondsToSelector:@selector(lowercaseString)]) {
        return text;
    }
    
    // 没有在当前语言下找到合适的文字，去找临近的语言，最后实在不行就返回英语版本的
    if ([@"chs" isEqualToString:language]
        && ( text = dict[@"cht"] ) != nil
        ) {
        return text;
    }
    
    if ([@"cht" isEqualToString:language]
        && ( text = dict[@"chs"] ) != nil
        ) {
        return text;
    }
    
    text = dict[@"en"];
    
    if (text)
    {
        // 英语版本的在，只能凑合一下了
        return text;
    }
    
    // 实在没有合适的语言，返回nil
    return nil;
}

#pragma mark - 过滤html特殊字符
- (NSString *)ignoreHTMLSpecialString
{
    NSString *returnStr = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    
    // 如果还有别的特殊字符，请添加在这里
    // ...
    /*
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&ge;" withString:@"—"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&mdash;" withString:@"®"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&ldquo;" withString:@"“"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@"”"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
     */
    
    return returnStr;
}

#pragma mark - MD5加密
- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    // 先转MD5，再转大写
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark - URL编码
- (NSString *)urlCodingToUTF8
{
    NSCharacterSet *encodeUrlSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodeUrl = [self stringByAddingPercentEncodingWithAllowedCharacters:encodeUrlSet];
    return encodeUrl;
}

#pragma mark - URL解码
- (NSString *)urlDecodingToUrlString
{
    return [self stringByRemovingPercentEncoding];
}

static NSArray *basicClassList;
static NSArray *setClassList;
static inline void initClassList();

static inline NSString *tapString(NSString *string);
static inline NSString *NSStringFromCATransform3D(CATransform3D transform);
static inline NSString *describeBasicClass(NSString *classString,id object);
static inline NSString *describeNSValue(NSValue *value);
static inline NSString *describeSet(NSString *setClass,NSSet *list);
static inline NSString *describeDictionary(NSDictionary *map);
static inline NSString *describeObject(id object);

NSString *describe(id object)
{
    initClassList();
    
    if (object == nil)
    {
        return @"nil";
    }
    
    for (NSString *classString in basicClassList)
    {
        if ([object isKindOfClass:NSClassFromString(classString)]){
            return describeBasicClass(classString,object);
        }
    }
    
    if ([object isKindOfClass:[NSValue class]]) {
        return describeNSValue(object);
    }
    
    for (NSString *setClass in setClassList) {
        if ([object isKindOfClass:NSClassFromString(setClass)]) {
            return describeSet(setClass, object);
        }
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return describeDictionary(object);
    }
    
    return describeObject(object);
}

#pragma mark - handle

static inline NSString *describeBasicClass(NSString *classString,id object)
{
    return __String(@"(%@ *)%@",classString,object);
}

static inline NSString *describeSet(NSString *setClass,NSSet *list)
{
    NSMutableString *printString = [NSMutableString string];
    [printString appendFormat:@"(%@ *)[",setClass];
    for (id value in list) {
        NSString *string = __String(@"\n%@",describe(value));
        [printString appendString:tapString(string)];
    }    [printString appendString:@"\n]"];
    return printString;
}

static inline NSString *describeDictionary(NSDictionary *map)
{
    NSMutableString *printString = [NSMutableString string];
    [printString appendString:@"{"];
    for (id key in map.allKeys) {
        NSString *string = __String(@"\n%@:%@",key,describe(map[key]));
        [printString appendString:tapString(string)];
    }
    [printString appendString:@"\n}"];
    return printString;
}

static inline NSString *describeObject(id object)
{
    if ([object isMemberOfClass:[NSObject class]]) {
        return [object description];
    }
    
    uint propertyCount;
    objc_property_t *propertyList = class_copyPropertyList([object class], &propertyCount);
    
    if (propertyCount == 0) {
        return [object description];
    }
    
    NSMutableString *printString = [NSMutableString string];
    [printString appendFormat:@"(%@ *){",[object class]];
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t property = propertyList[i];
        const char *name = property_getName(property);
        
        id value = [object valueForKey:@(name)];
        NSString *string = __String(@"\n%@ = %@",@(name),describe(value));
        [printString appendString:tapString(string)];
    }
    [printString appendString:@"\n}"];
    return printString;
}

static inline NSString *describeNSValue(NSValue *value)
{
    //NSNumber
    if (strcmp(value.objCType, @encode(short)) == 0) {
        return __String(@"(short)%@",value);
    }
    if (strcmp(value.objCType, @encode(int)) == 0) {
        return __String(@"(int)%@",value);
    }
    if (strcmp(value.objCType, @encode(long)) == 0) {
        return __String(@"(long)%@",value);
    }
    if (strcmp(value.objCType, @encode(long long)) == 0) {
        return __String(@"(long long)%@",value);
    }
    if (strcmp(value.objCType, @encode(float)) == 0) {
        return __String(@"(float)%@",value);
    }
    if (strcmp(value.objCType, @encode(double)) == 0) {
        return __String(@"(double)%@",value);
    }
    if (strcmp(value.objCType, @encode(BOOL)) == 0) {
        return __String(@"(BOOL)%@",value);
    }
    if (strcmp(value.objCType, @encode(bool)) == 0) {
        return __String(@"(bool)%@",value);
    }
    if (strcmp(value.objCType, @encode(char)) == 0) {
        return __String(@"(char)%@",value);
    }
    if (strcmp(value.objCType, @encode(unsigned short)) == 0) {
        return __String(@"(unsigned short)%@",value);
    }
    if (strcmp(value.objCType, @encode(unsigned int)) == 0) {
        return __String(@"(unsigned int)%@",value);
    }
    if (strcmp(value.objCType, @encode(unsigned long)) == 0) {
        return __String(@"(unsigned long)%@",value);
    }
    if (strcmp(value.objCType, @encode(unsigned long long)) == 0) {
        return __String(@"(unsigned long long)%@",value);
    }
    if (strcmp(value.objCType, @encode(unsigned char)) == 0) {
        return __String(@"(unsigned char)%@",value);
    }
    
    //basic type
    if (strcmp(value.objCType, @encode(CGPoint)) == 0) {
        NSString *string = NSStringFromCGPoint([value CGPointValue]);
        return __String(@"(CGPoint)%@",string);
    }
    if (strcmp(value.objCType, @encode(CGSize)) == 0) {
        NSString *string = NSStringFromCGSize([value CGSizeValue]);
        return __String(@"(CGSize)%@",string);
    }
    if (strcmp(value.objCType, @encode(CGVector)) == 0) {
        NSString *string = NSStringFromCGVector([value CGVectorValue]);
        return __String(@"(CGVector)%@",string);
    }
    if (strcmp(value.objCType, @encode(CGRect)) == 0) {
        NSString *string = NSStringFromCGRect([value CGRectValue]);
        return __String(@"(CGRect)%@",string);
    }
    if (strcmp(value.objCType, @encode(NSRange)) == 0) {
        return __String(@"(NSRange)%@",NSStringFromRange([value rangeValue]));
    }
    if (strcmp(value.objCType, @encode(CFRange)) == 0) {
        CFRange range;
        [value getValue:&range];
        return __String(@"(CFRange){%lu,%lu}",range.location,range.length);
    }
    if (strcmp(value.objCType, @encode(CGAffineTransform))  == 0) {
        NSString *string = NSStringFromCGAffineTransform([value CGAffineTransformValue]);
        return __String(@"(CGAffineTransform)%@",string);
    }
    if (strcmp(value.objCType, @encode(CATransform3D)) == 0) {
        NSString *string = NSStringFromCATransform3D([value CATransform3DValue]);
        return __String(@"(CATransform3D)%@",string);
    }
    if (strcmp(value.objCType, @encode(UIOffset)) == 0) {
        NSString *string = NSStringFromUIOffset([value UIOffsetValue]);
        return __String(@"(UIOffset)%@",string);
    }
    if (strcmp(value.objCType, @encode(UIEdgeInsets)) == 0) {
        NSString *string = NSStringFromUIEdgeInsets([value UIEdgeInsetsValue]);
        return __String(@"(UIEdgeInsets)%@",string);
    }
    
    return [value description];
}


#pragma mark - help

static inline void initClassList()
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        basicClassList = @[@"NSString",@"NSURL",@"NSDate",@"UIView",@"UIViewController"];
        setClassList = @[@"NSArray",@"NSSet",@"NSOrderedSet",@"NSPointerArray"];
    });
    
    return;
}

static inline NSString *tapString(NSString *string)
{
    return [string stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
}

static inline NSString *NSStringFromCATransform3D(CATransform3D transform)
{
    NSString *string1 = __String(@"{\n\tm11 = %g, m12 = %g, m13 = %g, m14 = %g",transform.m11,transform.m12,transform.m13,transform.m14);
    NSString *string2 = __String(@"\n\tm21 = %g, m22 = %g, m23 = %g, m24 = %g",transform.m21,transform.m22,transform.m23,transform.m24);
    NSString *string3 = __String(@"\n\tm31 = %g, m32 = %g, m33 = %g, m34 = %g",transform.m31,transform.m32,transform.m33,transform.m34);
    NSString *string4 = __String(@"\n\tm41 = %g, m42 = %g, m43 = %g, m44 = %g\n}",transform.m31,transform.m32,transform.m33,transform.m34);
    return __String(@"%@%@%@%@",string1,string2,string3,string4);
}


@end
