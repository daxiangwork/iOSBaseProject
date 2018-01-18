//
//  NetWorkingUtil.m
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NetWorkingUtil.h"
#import "YTKNetwork.h"
#import "CoreMacro.h"
#import "NetWorkingCommonParameter.h"

@implementation NetWorkingUtil

SYNTHESIZE_SINGLETON_FOR_CLASS(NetWorkingUtil);

- (void)startEngine{
    //初始化网络引擎
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = HttpBaseURLString;
    config.debugLogEnabled = HttpIsDebug;
    //添加公共参数
    NetWorkingCommonParameter *commonParameter = [NetWorkingCommonParameter commomParameter];
    [config addUrlFilter:commonParameter];
}


@end
