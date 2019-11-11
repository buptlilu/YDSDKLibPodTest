//
//  YDUserAgentInfoManager.m
//  YDADSDK-2.0.0 0.6.0 test
//
//  Created by lilu on 2019/11/7.
//  Copyright © 2019 Netease Youdao. All rights reserved.
//

#import "YDUserAgentInfoManager.h"
#import <WebKit/WebKit.h>

/**
 useragent
 */
NSString *ydUserAgent = @"";

/**
 获取useragent，用完之后置为nil
 */
WKWebView *ydWkWebView = nil;

NSString * const kYDUserDefaultsUserAgentKey = @"com.netease.youdao-ad-ios-sdk.user-agent";


@implementation YDUserAgentInfoManager

+ (void)load {
    [self obtainUserAgentFromWebView];
}

+ (void)obtainUserAgentFromWebView {
    NSString *cachedUserAgent = [NSUserDefaults.standardUserDefaults stringForKey:kYDUserDefaultsUserAgentKey];
    if (cachedUserAgent.length > 0) {
        ydUserAgent = cachedUserAgent;
    } else {
        NSString *systemVersion = [[UIDevice currentDevice].systemVersion stringByReplacingOccurrencesOfString:@"." withString:@"_"];
        NSString *deviceType = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? @"iPad" : @"iPhone";
        ydUserAgent = [NSString stringWithFormat:@"Mozilla/5.0 (%@; CPU %@ OS %@ like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/Youdao",
                      deviceType, deviceType, systemVersion];
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        ydWkWebView = [WKWebView new];
        [ydWkWebView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            if (error != nil) {
                NSLog(@"YDUserAgentInfoManager get user agent error: %@", error);
            } else if ([result isKindOfClass:NSString.class]) {
                ydUserAgent = result;
                [NSUserDefaults.standardUserDefaults setValue:result forKeyPath:kYDUserDefaultsUserAgentKey];
                NSLog(@"YDUserAgentInfoManager:%@", ydUserAgent);
            }
            ydWkWebView = nil;
        }];
    });
}

+ (NSString *)userAgent {
    return ydUserAgent;
}

@end
