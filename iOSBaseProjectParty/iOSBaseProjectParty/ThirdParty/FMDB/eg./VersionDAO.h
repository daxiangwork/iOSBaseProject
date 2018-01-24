//
//  VersionDAO.h
//  MBCore
//
//  Created by Eric on 15/12/21.
//  Copyright © 2015年 MotoBand-Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SynthesizeSingleton.h"

@class VersionModel;

@interface VersionDAO : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(VersionDAO);

- (BOOL)createTable;

- (VersionModel *)selectVersion;

- (BOOL)updateBrandVersion:(int)version;
- (BOOL)updateModelVersion:(int)version;
- (BOOL)updateLevelVersion:(int)version;
- (BOOL)updateAchievementVersion:(int)version;
- (BOOL)updateHotCityVersion:(int)version;
- (BOOL)updateRunTypeVersion:(int)version;
//- (BOOL)updateNewsLabelVersion:(int)version;
- (BOOL)updateServiceConfigVersion:(int)version;
- (BOOL)updateMotoBandGPVersion:(int)version;
- (BOOL)updateInsurancemotoDataVersion:(int)version;
- (BOOL)updateBoxtypeVersion:(int)version;
- (BOOL)updateMotoBrandParentVersion:(int)version;
- (BOOL)updateInsuranceUpdateVersion:(int)version;
- (BOOL)updateActivityVersion:(int)version;
- (BOOL)updateCategoryVersion:(int)version;
- (BOOL)updateTopicVersion:(int)version;
- (BOOL)updateDiscussVersion:(int)version;

- (BOOL)updateMallVersion:(int)version;
- (BOOL)updateMallNewcarVersion:(int)version;
- (BOOL)updateMallSecondVersion:(int)version;
- (BOOL)updateMallBrandVersion:(int)version;
- (BOOL)updateMallParentTypeVersion:(int)version;
- (BOOL)updateMallTypeVersion:(int)version;
- (BOOL)updateMallStyleVersion:(int)version;
- (BOOL)updateMallLabelVersion:(int)version;
- (BOOL)updateMallNotifyVersion:(int)version;

- (BOOL)updateGiftVersion:(int)version;
- (BOOL)updateBusinessServiceVersion:(int)version;
- (BOOL)updateBusinessTypeVersion:(int)version;
- (BOOL)updateAdPoolVersion:(int)version;

- (BOOL)updateTribalversion:(int)version;
- (BOOL)updateTribalTypeVersion:(int)version;

- (BOOL)updateVipcardinfoversion:(int)version;

@end
