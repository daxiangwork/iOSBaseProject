//
//  ViewController.m
//  iOSBaseProjectParty
//
//  Created by Eric on 2018/1/18.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "ViewController.h"

#import "VersionApi.h"
#import "NetWorkingRespose.h"
#import "NSObject+YYModel.h"
#import "CocoaLumberjack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"This is a new start !");
    
    VersionApi *api = [[VersionApi alloc] init];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        if (request.responseString) {
            NetWorkingRespose *response = [NetWorkingRespose modelWithJSON:request.responseString];
            if ([response.code isEqualToString:MBCode_SUCCESS]) {
                VersionModel *model = [VersionModel modelWithDictionary:response.data];
                NSLog(@"%@",model);
            }else{
                
            }
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
