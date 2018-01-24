//
//  VersionModel.h
//  MBCore
//
//  Created by Eric on 15/12/21.
//  Copyright © 2015年 MotoBand-Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionModel : NSObject

/**
 * 品牌版本号
 */
@property (nonatomic,assign)int motobrandversion;

/**
 * 类别版本号
 */
@property (nonatomic,assign)int motomodelversion;

@property (nonatomic,assign)int achievementversion;

@property (nonatomic,assign)int userlevelversion;
@property (nonatomic,assign)int hotcityversion;
@property (nonatomic,assign)int runtypeversion;
//@property (nonatomic,assign)int newslabelversion;
@property (nonatomic,assign)int serviceconfigversion;
@property (nonatomic,assign)int motobandgpversion;
@property (nonatomic,assign)int insurancemotodataversion;
@property (nonatomic,assign)int boxtypeversion;
@property (nonatomic,assign)int motobrandparentversion;
@property (nonatomic,assign)int insuranceupdateversion;
@property (nonatomic,assign)int activityversion;
@property (nonatomic,assign)int newscategoryversion;
@property (nonatomic,assign)int topicversion;
@property (nonatomic,assign)int discussversion;

@property (nonatomic,assign)int mallversion;
@property (nonatomic,assign)int mallnewcarversion;
@property (nonatomic,assign)int mallsecondversion;
@property (nonatomic,assign)int mallbrandversion;
@property (nonatomic,assign)int mallparenttypeversion;//一级分类
@property (nonatomic,assign)int mallstyleversion;
@property (nonatomic,assign)int malltypeversion;//二级分类
@property (nonatomic,assign)int malllabelversion;
@property (nonatomic,assign)int mallnotifyversion;

@property (nonatomic,assign)int giftversion;

@property (nonatomic,assign)int businessserviceversion;
@property (nonatomic,assign)int businesstypeversion;
@property (nonatomic,assign)int adpoolversion;

@property (nonatomic,assign)int tribalversion;
@property (nonatomic,assign)int tribaltypeversion;

@property (nonatomic,assign)int vipcardinfoversion;

@end
