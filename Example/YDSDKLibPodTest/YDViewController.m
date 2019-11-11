//
//  YDViewController.m
//  YDSDKLibPodTest
//
//  Created by buptlilu on 11/11/2019.
//  Copyright (c) 2019 buptlilu. All rights reserved.
//

#import "YDViewController.h"
#import "YDUserAgentInfoManager.h"

@interface YDViewController ()

@end

@implementation YDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"user agent:%@", [YDUserAgentInfoManager userAgent]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
