//
//  EEDBManager.m
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/24.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "EEDBManager.h"
#import "CocoaLumberjack.h"

//1.0.0=0;1.1.0=1;1.2.0,1.2.1=2;1.3.0=3;1.4.0=4;1.5.0=5;1.5.1=6;1.6.0=7;1.7.0,1=8;1.8.0=9;1.8.1=10;1.9.0=11;1.9.2=12;
const static NSInteger DB_VER = 0;//用户数据库表升级操作，如果表结构有修改，需要修改+1

#define USERDEFAULTKEY_UserOld_DB_Version [NSString stringWithFormat:@"UserOld_DB_Version-%@",self.identifyID]

@interface EEDBManager (){
    
}
@property(nonatomic,copy)NSString *identifyID;

@end

@implementation EEDBManager

SYNTHESIZE_SINGLETON_FOR_CLASS(EEDBManager);

#pragma mark - < 生命周期函数 >

-(id)init{
    self=[super init];
    if(self){
        _dbHandlers = [[NSMutableArray alloc] init];
        _dbCommonHandlers= [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)initDB:(NSString*)identifyID{
    if (identifyID == nil) {
        DDLogDebug(@"DataBase inti failed without identifyID.\r\n");
        return;
    }
    self.identifyID = identifyID;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *userPathDirectory = [documentDirectory stringByAppendingPathComponent:identifyID];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:userPathDirectory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:userPathDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSString *dbFile = [userPathDirectory stringByAppendingPathComponent:@"core.db"];
    if (!self.dbQueue || ![self.dbQueue.path isEqualToString:dbFile]) {
        
        [self closeDB];
        self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbFile];
        [self registerDBHandler];
        [self createTables];
        [self updateTables];
        DDLogDebug(@"DataBase has been open.");
    }else{
        DDLogDebug(@"DataBase already opened.");
    }
    DDLogDebug(@"DBPath = \r\n \r\n %@ \r\n \r\n",dbFile);
}

/* *********************************** */
/*  如果对应业务模块需要使用数据库         */
/*  1、实现DBProtocol协议               */
/*  2、在registerDBHandler方法中注册handler* */
/* *********************************** */
- (void)registerDBHandler
{
    [_dbHandlers removeAllObjects];
//    //App数据
//    [_dbHandlers addObject:[VersionManager sharedVersionManager]];
//    //个人信息数据
//    [_dbHandlers addObject:[UserProfileManager sharedUserProfileManager]];
//    [_dbHandlers addObject:[GarageManager sharedGarageManager]];
//    [_dbHandlers addObject:[RideLineManager sharedRideLineManager]];
}

/**
 根据业务模块注册handler统一创建各个业务模块所需表
 */
- (void)createTables {
    for (id<DBHandlerProtocol> handler in _dbHandlers){
        [handler createTable];
    }
    
}

/**
 数据库表升级
 */
- (void)updateTables{
    NSInteger oldVersion=0;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *Old_DB_Version = [defaults objectForKey:USERDEFAULTKEY_UserOld_DB_Version];
    if (Old_DB_Version) {
        oldVersion = [Old_DB_Version integerValue];
        if (oldVersion>=DB_VER) {
            return;
        }
    }else{
        oldVersion = DB_VER;
    }
    
    DDLogDebug(@"DataBase update start.oldversion:%ld", (long)(oldVersion+1));
    
    __block BOOL ret = YES;
    
    switch (oldVersion+1) {
        case 0:
        case 1:{
//            NSString *sql1 = @"ALTER TABLE `Box` ADD COLUMN `titleimage` Text ";
//            NSString *sql12 = @"ALTER TABLE `Box` ADD COLUMN `boxkind` Integer ";
//            NSString *sql13 = @"ALTER TABLE `Box` ADD COLUMN `subtitle` Text ";
//
//            NSString *sql2 = @"ALTER TABLE `Garage` ADD COLUMN `addtime` Integer";
//            NSString *sql22 = @"ALTER TABLE `Garage` ADD COLUMN `mileage` Integer DEFAULT '0' ";
//
//            NSString *sql3 = @"ALTER TABLE `RideLine` ADD COLUMN `synctime` Integer DEFAULT '0' ";
//
//            [[DBManager sharedDBManager].dbQueue inDatabase:^(FMDatabase *db) {
//                ret = [db executeUpdate:sql1];
//                if (ret) {
//                    DDLogDebug(@"ALTER TABLE `Box` ADD COLUMN `titleimage` Text Success");
//                }else{
//                    DDLogError(@"ALTER TABLE `Box` ADD COLUMN `titleimage` Text Failed");
//
//                }
//
//                if (ret) {
//                    ret = [db executeUpdate:sql12];
//                    if (ret) {
//                        DDLogDebug(@"ALTER TABLE `Box` ADD COLUMN `boxkind` Integer Success");
//                    }else{
//                        DDLogError(@"ALTER TABLE `Box` ADD COLUMN `boxkind` Integer Failed");
//                    }
//                }
//
//                if (ret) {
//                    ret = [db executeUpdate:sql13];
//                    if (ret) {
//                        DDLogDebug(@"ALTER TABLE `Box` ADD COLUMN `subtitle` Text  Success");
//                    }else{
//                        DDLogError(@"ALTER TABLE `Box` ADD COLUMN `subtitle` Text  Failed");
//                    }
//                }
//
//            }];
//            if (ret) {
//                [[DBManager sharedDBManager].dbQueue inDatabase:^(FMDatabase *db) {
//                    ret = [db executeUpdate:sql3];
//                    if (ret) {
//                        DDLogDebug(@"ALTER TABLE `RideLine` ADD COLUMN `synctime` Integer DEFAULT '0' Success");
//                    }else{
//                        DDLogError(@"ALTER TABLE `RideLine` ADD COLUMN `synctime` Integer DEFAULT '0' Failed");
//                    }
//                }];
//            }
            
        }
        case 2:{
//            if (ret) {
//                ret=[self update2];
//                if (ret) {
//                    DDLogDebug(@"update2 Success");
//                }else{
//                    DDLogError(@"update2 Failed");
//                }
//            }
        }
        
    }
    
    [defaults setObject:[NSString stringWithFormat: @"%ld", (long)DB_VER] forKey:USERDEFAULTKEY_UserOld_DB_Version];
    [defaults synchronize];
    
    if (!ret) {
        DDLogError(@"DataBase update faild:oldversion:%ld,newverison:%ld", (long)oldVersion,(long)DB_VER);
        [self removeDB:self.identifyID];
        [self initDB:self.identifyID];
    }else{
        DDLogDebug(@"DataBase update success:oldversion:%ld,newverison:%ld", (long)oldVersion,(long)DB_VER);
    }
}

-(void)removeDB:(NSString *)identifyID{
    [self closeDB];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *userPathDirectory = [documentDirectory stringByAppendingPathComponent:identifyID];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:userPathDirectory]) {
        NSString *dbFile = [userPathDirectory stringByAppendingPathComponent:@"core.db"];
        NSError * error ;
        if(![[NSFileManager defaultManager] removeItemAtPath:dbFile error:&error]){
            DDLogError(@"Remove DB Error:%@",error.userInfo);
        }else {
            DDLogInfo(@"Remove DB Success");
        }
        self.dbQueue = nil ;
    }
}


- (void)closeDB{
    [self.dbQueue close];
    self.dbQueue = nil ;
    [_dbHandlers removeAllObjects];
}

-(void)initCommenDB{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:documentDirectory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:documentDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    NSString *dbFile = [documentDirectory stringByAppendingPathComponent:@"common.db"];
    if (!self.dbCommonQueue || ![self.dbCommonQueue.path isEqualToString:dbFile]) {
        [self closeCommonDB];
        self.dbCommonQueue = [FMDatabaseQueue databaseQueueWithPath:dbFile];
        [self registerCommonDBHandler];
        [self createCommonTables];
        DDLogDebug(@"initCommenDB DataBase has been open.\r\n%@", dbFile);
    }else{
        DDLogDebug(@"initCommenDB DataBase already opened.\r\n%@", dbFile);
    }
}

- (void)closeCommonDB{
    [self.dbCommonQueue close];
    self.dbCommonQueue = nil ;
    [_dbCommonHandlers removeAllObjects];
}


/**
 注册业务模块handler，同用户单独数据库雷同
 */
- (void)registerCommonDBHandler
{
    [_dbCommonHandlers removeAllObjects];
    //App数据
//    [_dbCommonHandlers addObject:[MotoAdManager sharedMotoAdManager]];
}

- (void)createCommonTables {
    for (id<DBHandlerProtocol> handler in _dbCommonHandlers){
        [handler createTable];
    }
}


@end
