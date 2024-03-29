//
//  AppDelegate.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2023 Criteo. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "AppDelegate.h"
#import "AdConfigurations.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <CriteoPublisherSdk/CriteoPublisherSdk.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GADMobileAds.sharedInstance startWithCompletionHandler:nil];
    
    // Enable Criteo SDK debug logs
    [Criteo setVerboseLogsEnabled:YES];

    NSArray *adUnits = @[
        [AdConfigurations criteoBannerAdUnit],
        [AdConfigurations criteoInterstitialAdUnit]
    ];
    
    // Register Criteo SDK as early as possible
    [[Criteo sharedCriteo] registerCriteoPublisherId:[AdConfigurations criteoPublisherId] withAdUnits:adUnits];

    return YES;
}


@end
