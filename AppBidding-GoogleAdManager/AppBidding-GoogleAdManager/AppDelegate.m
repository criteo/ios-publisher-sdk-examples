//
//  AppDelegate.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
//

#import "AppDelegate.h"
#import "AdConfigurations.h"
@import CriteoPublisherSdk;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSArray *adUnits = @[
        [AdConfigurations criteoBannerAdUnit],
        [AdConfigurations criteoInterstitialAdUnit]
    ];
    // Register Criteo SDK as early as possible
    [[Criteo sharedCriteo] registerCriteoPublisherId:[AdConfigurations criteoPublisherId] withAdUnits:adUnits];

    return YES;
}


@end
