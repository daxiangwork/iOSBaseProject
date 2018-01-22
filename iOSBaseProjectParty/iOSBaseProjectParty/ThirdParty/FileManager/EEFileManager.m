//
//  EEFileManager.m
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/22.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "EEFileManager.h"
#import "FCFileManager.h"

@interface EEFileManager (){
    
}
@property(nonatomic,copy)NSString *rootName;

@end

@implementation EEFileManager

SYNTHESIZE_SINGLETON_FOR_CLASS(EEFileManager);

#pragma mark - < 外部方法 >

- (void)setFileSystemRootName:(NSString *)rootName{
    if (rootName) {
        rootName = [rootName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (rootName.length>0) {
            self.rootName = rootName;
        }
    }
}

/**
 创建一个文件路径
 
 @param fileName 文件名 eg.photo
 @param fileType 文件类型
 @param extension 后缀名 eg.png
 @return 文件路径
 */
- (NSString *)createFilePath:(NSString *)fileName fileType:(EEFileType)fileType extension:(NSString *)extension{
    if (fileName == nil || [fileName isEqualToString:@""] || self.rootName == nil) {
        return nil;
    }
    if (extension == nil) {
        extension = @"";
    }
    NSString *filePath = [NSString stringWithFormat:@"/%@",[[[self getDirectoryPahtWithFileType:fileType] stringByAppendingPathComponent:fileName] stringByAppendingString:extension]];
    int count = 1;
    NSString *realPath = [NSString stringWithFormat:@"%@%@",[self getDocumentPath],filePath];
    while ([FCFileManager existsItemAtPath:realPath]) {
        filePath = [NSString stringWithFormat:@"/%@",[[[[self getDirectoryPahtWithFileType:fileType] stringByAppendingPathComponent:fileName] stringByAppendingFormat:@"(%d)",(int)count] stringByAppendingString:extension]];
        realPath = [NSString stringWithFormat:@"%@%@",[self getDocumentPath],filePath];
        count++;
    }
    return filePath;
}

/**
 保存文件
 
 @param relativeFilePath 相对地址
 @param data 文件数据
 @return YES，NO
 */
- (BOOL)saveFile:(NSString *)relativeFilePath data:(NSData *)data{
    if (data == nil || relativeFilePath == nil || [relativeFilePath isEqualToString:@""] || self.rootName == nil) {
        return NO;
    }
    BOOL ret = YES;
    NSString *absoluteFilePath = [NSString stringWithFormat:@"%@%@",[self getDocumentPath],relativeFilePath];
    ret = [FCFileManager writeFileAtPath:absoluteFilePath content:data];
    return ret;
}

/**
 获取文件
 
 @param relativeFilePath 相对地址
 @return data
 */
- (NSData *)getFile:(NSString *)relativeFilePath{
    if (relativeFilePath == nil || [relativeFilePath isEqualToString:@""] || self.rootName == nil) {
        return nil;
    }
    NSString *absoluteeFilePath = [NSString stringWithFormat:@"%@%@",[self getDocumentPath],relativeFilePath];
    return [FCFileManager readFileAtPathAsData:absoluteeFilePath];
}

/**
 删除文件
 
 @param relatevieFilePath 相对地址
 @return YES，NO
 */
- (BOOL)removeFile:(NSString *)relatevieFilePath{
    if (relatevieFilePath == nil || [relatevieFilePath isEqualToString:@""] || self.rootName == nil) {
        return nil;
    }
    NSString *absoluteeFilePath = [NSString stringWithFormat:@"%@%@",[self getDocumentPath],relatevieFilePath];
    return [FCFileManager removeItemAtPath:absoluteeFilePath];
}

#pragma mark - < 内部方法 >

- (NSString *)getDirectoryPahtWithFileType:(EEFileType)fileType{
    NSString *dirPath = nil;
    if (self.rootName != nil) {
        NSString *typePath = nil;
        switch (fileType) {
            case EEFileType_Image:
                typePath = kFileType_Image;
                break;
            case EEFileType_Video:
                typePath = kFileType_Video;
                break;
            case EEFileType_Audio:
                typePath = kFileType_Audio;
                break;
            case EEFileType_File:
                typePath = kFileType_File;
                break;
            case EEFileType_Setting:
                typePath = kFileType_Setting;
                break;
            default:
                typePath = kFileType_File;
                break;
        }
        dirPath = [self.rootName stringByAppendingPathComponent:typePath];
    }
    return dirPath;
}

- (NSString *)getDocumentPath{
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    return [filePaths objectAtIndex:0];
}

- (BOOL)createEmptyFile:(NSString *)absoluteFilePath{
   return [FCFileManager createFileAtPath:absoluteFilePath overwrite:YES];
}

@end
