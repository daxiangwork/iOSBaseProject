//
//  VersionApi.m
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "VersionApi.h"

@implementation VersionApi

/**
 请求url

 @return url
 */
- (NSString *)requestUrl{
    return @"getdataversion";
}

/**
 请求方式

 @return method
 */
- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}


//- (id)requestArgument {
//    return @{ @"id": _userId };
//}
//
//- (id)jsonValidator {
//    return @{
//             @"nick": [NSString class],
//             @"level": [NSNumber class]
//             };
//}

//- (NSInteger)cacheTimeInSeconds {
//    return 60 * 3;
//}

@end

@implementation VersionModel


@end
