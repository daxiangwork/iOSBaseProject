//
//  NetWorkingRespose.h
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - < 应答码 >

extern NSString *const MBCode_SUCCESS;
extern NSString *const MBCode_ERROR;


/**
 网络返回结果，根据具体项目服务器返回规范定义
 */
@interface NetWorkingRespose : NSObject

@property (nonatomic,copy)NSString *code;
@property (nonatomic,copy)NSString *msg;
@property (nonatomic,assign)long long updatetime;
@property (nonatomic,assign)id data;
@property (nonatomic,strong)NSDictionary *map;

@end
