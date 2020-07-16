//
//  AppDelegate.m
//  AppBidding-MoPub
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
    // Override point for customization after application launch.
    
    NSArray *adUnits = @[
        [AdConfigurations criteoBannerAdUnit],
        [AdConfigurations criteoInterstitialAdUnit]
    ];
    
    MPMoPubConfiguration *sdkConfig = [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization:[AdConfigurations mopubBannerAdUnitId]];
    
    // Register Criteo SDK as early as possible
    [[Criteo sharedCriteo] registerCriteoPublisherId:[AdConfigurations criteoPublisherId] withAdUnits:adUnits];
    [[MoPub sharedInstance] initializeSdkWithConfiguration:sdkConfig completion:nil];
    return YES;
    
}


@end
