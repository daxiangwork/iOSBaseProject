//
//  NetWorkingCommonParameter.m
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NetWorkingCommonParameter.h"
#import "AFURLRequestSerialization.h"
#import "CoreMacro.h"

@interface NetWorkingCommonParameter (){
    NSMutableDictionary *_parameter;
}

@end

@implementation NetWorkingCommonParameter


#pragma mark - < 内部方法 >

- (instancetype)init
{
    self = [super init];
    if (self) {
        _parameter = [[NSMutableDictionary alloc] init];
        
        //在这里添加需要的公共参数
        NSString *version = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleShortVersionString"];
        NSString *build = [[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleVersion"];
        NSString *cversion = [NSString stringWithFormat:@"%@.%@",version,build];
        
        [_parameter setObject:cversion forKey:@"cversion"];
        [_parameter setObject:@"1" forKey:@"ctype"];
        
        
    }
    return self;
}

+ (NetWorkingCommonParameter *)commomParameter{
    return [[self alloc] init];
}

- (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString appendParameters:(NSDictionary *)parameters {
    NSString *paraUrlString = AFQueryStringFromParameters(parameters);
    if (!(paraUrlString.length > 0)) {
        return originUrlString;
    }
    BOOL useDummyUrl = NO;
    static NSString *dummyUrl = nil;
    NSURLComponents *components = [NSURLComponents componentsWithString:originUrlString];
    if (!components) {
        useDummyUrl = YES;
        if (!dummyUrl) {
            dummyUrl = HttpBaseURLString;
        }
        components = [NSURLComponents componentsWithString:dummyUrl];
    }
    
    NSString *queryString = components.query ?: @"";
    NSString *newQueryString = [queryString stringByAppendingFormat:queryString.length > 0 ? @"&%@" : @"%@", paraUrlString];
    
    components.query = newQueryString;
    
    if (useDummyUrl) {
        return [components.URL.absoluteString substringFromIndex:dummyUrl.length - 1];
    } else {
        return components.URL.absoluteString;
    }
    
}

#pragma mark - < YTKUrlFilterProtocol >

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request{
    return [self urlStringWithOriginUrlString:originUrl appendParameters:_parameter];
}











@end
