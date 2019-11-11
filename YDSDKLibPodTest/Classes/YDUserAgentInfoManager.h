//
//  YDUserAgentInfoManager.h
//  YDADSDK-2.0.0
//  使用WKWebview获取user agent，获取方式为异步
//  Created by lilu on 2019/11/7.
//  Copyright © 2019 Netease Youdao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YDUserAgentInfoManager : NSObject
+ (NSString *)userAgent;
@end
