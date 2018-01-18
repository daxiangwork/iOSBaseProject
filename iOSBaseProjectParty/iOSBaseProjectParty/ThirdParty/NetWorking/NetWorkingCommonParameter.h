//
//  NetWorkingCommonParameter.h
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkConfig.h"

@interface NetWorkingCommonParameter : NSObject<YTKUrlFilterProtocol>

/**
 获取公共参数

 @return parameter
 */
+ (NetWorkingCommonParameter *)commomParameter;


@end
