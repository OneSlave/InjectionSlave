//
//  InjectionTrigger.m
//  Injection
//
//  Created by mac on 2020/7/8.
//  Copyright © 2020 chef. All rights reserved.
//

#import "InjectionTrigger.h"
#import "Injection.h"

@implementation InjectionTrigger

#ifdef DEBUG
#ifdef TARGET_IPHONE_SIMULATOR

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __weak __typeof(NSNotificationCenter *) center = [NSNotificationCenter defaultCenter];
        __block id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [[NSBundle  bundleWithPath:InjectionBundlePath] load];
            printf("\n💉💉💉💉💉💉💉💉💉💉 启动:%s 💉💉💉💉💉💉💉💉💉💉\n\n", InjectionBundlePath.UTF8String);
            [center removeObserver:observer name:UIApplicationDidFinishLaunchingNotification object:nil];
        }];
    });
}

#endif
#endif

@end
