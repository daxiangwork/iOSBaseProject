//
//  VersionDAO.m
//  MBCore
//
//  Created by Eric on 15/12/21.
//  Copyright © 2015年 MotoBand-Eric. All rights reserved.
//

#import "VersionDAO.h"
#import "EEDBManager.h"
#import "FMDatabase.h"

#import "VersionModel.h"
#import "CocoaLumberjack.h"

@implementation VersionDAO

SYNTHESIZE_SINGLETON_FOR_CLASS(VersionDAO);

- (BOOL)createTable{
    __block BOOL ret = NO;
    NSString *sql = @"create table Version(\
    motoBrandVersion        Integer,\
    motoModelVersion        Interger,\
    achievementVersion      Interger,\
    userlevelVersion      Interger,\
    hotcityVersion      Interger,\
    runtypeVersion      Interger,\
    serviceconfigversion    Interger,\
    motobandgpversion   Interger,\
    insurancemotodataversion Interger,\
    boxtypeversion Interger,\
    motobrandparentversion Interger,\
    insuranceupdateversion Interger,\
    activityversion Interger,\
    newscategoryversion Interger,\
    topicversion Interger,\
    mallversion   Interger,\
    mallnewcarversion Interger,\
    mallsecondversion Interger,\
    mallbrandversion Interger,\
    mallparenttypeversion Interger,\
    mallstyleversion Interger,\
    malltypeversion Interger,\
    malllabelversion Interger,\
    mallnotifyversion Integer,\
    giftversion Integer,\
    discussversion Integer,\
    businessserviceversion Integer,\
    businesstypeversion Integer,\
    adpoolversion Integer,\
    tribalversion Integer,\
    tribaltypeversion Integer,\
    vipcardinfoversion Integer\
    );";
    
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        ret = [db executeUpdate:sql];
        if (ret) {
       
            
            DDLogDebug(@"Version Create Table Success");
        }else{
            DDLogError(@"Version Create Table Failed");
        }
    }];
    
    if (ret) {
        [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
            NSString *sql2 = [NSString stringWithFormat:@"insert or replace into Version(motoBrandVersion,motoModelVersion,achievementVersion,userlevelVersion,hotcityVersion,runtypeVersion,serviceconfigversion,motobandgpversion,insurancemotodataversion,boxtypeversion,motobrandparentversion,insuranceupdateversion,activityversion,newscategoryversion,topicversion,mallversion,mallnewcarversion,mallsecondversion,mallbrandversion,mallparenttypeversion,mallstyleversion,malltypeversion,malllabelversion,mallnotifyversion,giftversion,discussversion,businessserviceversion,businesstypeversion,adpoolversion,tribalversion,tribaltypeversion,vipcardinfoversion) values (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);"];
            ret = [db executeUpdate:sql2];
            if (ret) {
                DDLogDebug(@"Version initdata Success");
            }else{
                DDLogError(@"Version initdata Failed");
            }
        }];
    }
    
    return ret;
}

- (VersionModel *)selectVersion{
    __block VersionModel *versionModel = nil;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"select * from Version limit 1"];
        FMResultSet *set = [db executeQuery:sql];
        if (set) {
            versionModel = [[VersionModel alloc] init];
            while ([set next]) {
                versionModel.motobrandversion = [set intForColumn:@"motoBrandVersion"];
                versionModel.motomodelversion = [set intForColumn:@"motoModelVersion"];
                versionModel.userlevelversion = [set intForColumn:@"userlevelversion"];
                versionModel.achievementversion = [set intForColumn:@"achievementversion"];
                versionModel.hotcityversion = [set intForColumn:@"hotcityVersion"];
                versionModel.runtypeversion = [set intForColumn:@"runtypeversion"];
                versionModel.serviceconfigversion = [set intForColumn:@"serviceconfigversion"];
                versionModel.motobandgpversion = [set intForColumn:@"motobandgpversion"];
                versionModel.insurancemotodataversion = [set intForColumn:@"insurancemotodataversion"];
                versionModel.boxtypeversion = [set intForColumn:@"boxtypeversion"];
                versionModel.motobrandparentversion = [set intForColumn:@"motobrandparentversion"];
                versionModel.insuranceupdateversion = [set intForColumn:@"insuranceupdateversion"];
                versionModel.activityversion = [set intForColumn:@"activityversion"];
                versionModel.newscategoryversion = [set intForColumn:@"newscategoryversion"];
                versionModel.topicversion = [set intForColumn:@"topicversion"];
                versionModel.discussversion = [set intForColumn:@"discussversion"];
                
                versionModel.mallversion = [set intForColumn:@"mallversion"];
                versionModel.mallnewcarversion = [set intForColumn:@"mallnewcarversion"];
                versionModel.mallsecondversion = [set intForColumn:@"mallsecondversion"];
                versionModel.mallbrandversion = [set intForColumn:@"mallbrandversion"];
                versionModel.mallparenttypeversion = [set intForColumn:@"mallparenttypeversion"];
                versionModel.mallstyleversion = [set intForColumn:@"mallstyleversion"];
                versionModel.malltypeversion = [set intForColumn:@"malltypeversion"];
                versionModel.malllabelversion = [set intForColumn:@"malllabelversion"];
                versionModel.mallnotifyversion = [set intForColumn:@"mallnotifyversion"];
                
                versionModel.giftversion = [set intForColumn:@"giftversion"];
                versionModel.businessserviceversion = [set intForColumn:@"businessserviceversion"];
                versionModel.businesstypeversion = [set intForColumn:@"businesstypeversion"];
                versionModel.adpoolversion = [set intForColumn:@"adpoolversion"];
                
                versionModel.tribalversion = [set intForColumn:@"tribalversion"];
                versionModel.tribaltypeversion = [set intForColumn:@"tribaltypeversion"];
                versionModel.vipcardinfoversion = [set intForColumn:@"vipcardinfoversion"];
            }
        }
        [set close];
    }];
    return versionModel;
}


- (BOOL)updateBrandVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set motoBrandVersion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateModelVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set motoModelVersion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}


- (BOOL)updateLevelVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set userlevelVersion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateAchievementVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set achievementVersion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}


- (BOOL)updateHotCityVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set hotcityversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}


- (BOOL)updateRunTypeVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set runtypeversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

//- (BOOL)updateNewsLabelVersion:(int)version{
//    
//    __block BOOL ret = NO;
//    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
//        NSString *sql = [NSString stringWithFormat:@"update Version set newslabelversion =?;"];
//        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
//                                                          [NSNumber numberWithInt:version],
//                                                          nil]];
//    }];
//    return ret;
//}


- (BOOL)updateServiceConfigVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set serviceconfigversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateMotoBandGPVersion:(int)version{
    
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set motobandgpversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateInsurancemotoDataVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set insurancemotodataversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateBoxtypeVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set boxtypeversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateMotoBrandParentVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set motobrandparentversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateInsuranceUpdateVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set insuranceupdateversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateActivityVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set activityversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateCategoryVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set newscategoryversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateTopicVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set topicversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateDiscussVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set discussversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateMallVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set mallversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateMallNewcarVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set mallnewcarversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateMallSecondVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set mallsecondversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateMallBrandVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set mallbrandversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateMallParentTypeVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set mallparenttypeversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateMallTypeVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set malltypeversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateMallStyleVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set mallstyleversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateMallLabelVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set malllabelversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
    
}
- (BOOL)updateMallNotifyVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set mallnotifyversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
    
}

- (BOOL)updateGiftVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set giftversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateBusinessServiceVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set businessserviceversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateBusinessTypeVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set businesstypeversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateAdPoolVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set adpoolversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateTribalversion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set tribalversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}

- (BOOL)updateTribalTypeVersion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set tribaltypeversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}
- (BOOL)updateVipcardinfoversion:(int)version{
    __block BOOL ret = NO;
    [[EEDBManager sharedEEDBManager].dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"update Version set vipcardinfoversion =?;"];
        ret = [db executeUpdate:sql withArgumentsInArray:[NSArray arrayWithObjects:
                                                          [NSNumber numberWithInt:version],
                                                          nil]];
    }];
    return ret;
}


@end
