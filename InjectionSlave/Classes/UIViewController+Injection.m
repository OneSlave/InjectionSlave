//
//  UIViewController+Injection.m
//  Nbh
//
//  Created by apple on 2023/4/27.
//  Copyright © 2023 Hangzhou Anchu Technology. All rights reserved.
//

#import "UIViewController+Injection.h"
#import <objc/runtime.h>
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UIViewController (Injection)

#ifdef DEBUG
#ifdef TARGET_IPHONE_SIMULATOR

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getInstanceMethod([self class], @selector(loadView));
        Method method2 = class_getInstanceMethod([self class], @selector(fk_loadView));
        method_exchangeImplementations(method1, method2);
    });
}

- (instancetype)fk_loadView {
    if (![NSStringFromClass([self class]) hasPrefix:@"UI"] && ![NSStringFromClass([self class]) hasPrefix:@"_"]) {
        if ([self respondsToSelector:@selector(injectedNotifi)]) {
            printf("\n💉💉💉💉💉💉💉💉💉💉 注入:%s 💉💉💉💉💉💉💉💉💉💉\n\n", NSStringFromClass([self class]).UTF8String);
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(injectedNotifi) name:@"INJECTION_BUNDLE_NOTIFICATION" object:nil];
        }
    }
    return [self fk_loadView];
}

- (void)injectedNotifi {
    [self injectedClean];
}

- (void)injectedClean {
    // 移除子视图
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

#endif
#endif

@end
#pragma clang diagnostic pop
