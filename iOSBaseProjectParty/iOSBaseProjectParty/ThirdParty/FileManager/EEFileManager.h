//
//  EEFileManager.h
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/22.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

#define kFileType_Image        @"Image"
#define kFileType_Video        @"Video"
#define kFileType_Audio        @"Audio"
#define kFileType_File         @"File"
#define kFileType_Setting         @"Setting"

#define kFile_Extension_IMAGETHUMB    @"_thumb"

typedef enum FileType
{
    EEFileType_Image=1,
    EEFileType_Audio=2,
    EEFileType_Video=3,
    EEFileType_File=4,
    EEFileType_Setting=5,
}EEFileType;


@interface EEFileManager : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(EEFileManager);

#pragma mark - < 文件路径相关 >

/**
 设置文件系统跟目录名称

 @param rootName 根目录名称
 */
- (void)setFileSystemRootName:(NSString *)rootName;

/**
 创建一个文件路径，（所有创建的路径都在Doc目录下）

 @param fileName 文件名 eg.photo
 @param fileType 文件类型
 @param extension 后缀名 eg.png
 @return 文件路径
 */
- (NSString *)createFilePath:(NSString *)fileName fileType:(EEFileType)fileType extension:(NSString *)extension;


/**
 保存文件

 @param relativeFilePath 相对地址
 @param data 文件数据
 @return YES，NO
 */
- (BOOL)saveFile:(NSString *)relativeFilePath data:(NSData *)data;


/**
 获取文件

 @param relativeFilePath 相对地址
 @return data
 */
- (NSData *)getFile:(NSString *)relativeFilePath;

/**
 删除文件

 @param relatevieFilePath 相对地址
 @return YES，NO
 */
- (BOOL)removeFile:(NSString *)relatevieFilePath;
@end
