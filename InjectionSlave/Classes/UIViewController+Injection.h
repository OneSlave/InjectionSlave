//
//  UIViewController+Injection.h
//  Nbh
//
//  Created by apple on 2023/4/27.
//  Copyright © 2023 Hangzhou Anchu Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Injection)

- (void)injected;
- (void)injectedNotifi NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
