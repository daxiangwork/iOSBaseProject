//
//  NetWorkingUtil.h
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

@interface NetWorkingUtil : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(NetWorkingUtil);

/**
 启动网络请求引擎
 */
- (void)startEngine;

@end
