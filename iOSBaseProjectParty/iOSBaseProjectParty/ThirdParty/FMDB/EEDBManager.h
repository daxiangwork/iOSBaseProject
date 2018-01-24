//
//  EEDBManager.h
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/24.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SynthesizeSingleton.h"
#import "FMDatabaseQueue.h"

@protocol DBHandlerProtocol <NSObject>

@required
- (void)createTable;

@end

@interface EEDBManager : NSObject{
    NSMutableArray *_dbHandlers;//注册登录后，单独用户独立数据库
    NSMutableArray *_dbCommonHandlers;//程序相同数据库（存放不区分用户相同数据）
}

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(EEDBManager)

@property(nonatomic,strong) FMDatabaseQueue *dbQueue;
@property(nonatomic,strong) FMDatabaseQueue *dbCommonQueue;

/**
 初始化数据库

 @param identifyID 唯一标识
 */
- (void)initDB:(NSString *)identifyID;

/**
 关闭数据库
 */
- (void)closeDB;

/**
 初始化共有数据库
 */
- (void)initCommenDB;

@end
