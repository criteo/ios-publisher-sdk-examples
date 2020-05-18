//
//  AdConfigurations.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
//

#import "AdConfigurations.h"
@import CriteoPublisherSdk;

// Here we use Google Ad Manager test Ad Unit ID in order to demonstrate the integration
// If you'd like to see Criteo banner in action, you need to use your own Ad Unit IDs, with Criteo line items targeting the Ad Units.
// To setup Criteo line items, please refer to https://publisherdocs.criteotilt.com/app/ios/app-bidding/google-ad-manager/#ad-server-setup-banner-and-interstitial-
static NSString* const gamBannerAdUnitId = @"/6499/example/banner";
static NSString* const gamInterstitialAdUnitId = @"/6499/example/interstitial";

// This is a test Criteo Publisher ID that works for this sample app
// In your application, update this value with your own Criteo Publisher ID
static NSString* const criteoPublisherId = @"B-000000";

// Here we use test Criteo Ad Unit IDs in order to return test ads
// In your application, Criteo Ad Unit IDs are typically the same as your Google Ad Manager's Ad Unit ID
static NSString* const criteoBannerAdUnitId = @"30s6zt3ayypfyemwjvmp";
static NSString* const criteoInterstitialAdUnitId = @"6yws53jyfjgoq1ghnuqb";

static CRBannerAdUnit *criteoBannerAdUnit;
static CRInterstitialAdUnit *criteoInterstitialAdUnit;


@implementation AdConfigurations

# pragma mark - Google Ad Manager

+ (NSString *)gamBannerAdUnitId {
    return gamBannerAdUnitId;
}

+ (NSString *)gamInterstitialAdUnitId {
    return gamInterstitialAdUnitId;
}

# pragma mark - Criteo

+ (NSString *)criteoPublisherId {
    return criteoPublisherId;
}

+ (CRBannerAdUnit *)criteoBannerAdUnit {
    if (criteoBannerAdUnit == NULL) {
        criteoBannerAdUnit = [[CRBannerAdUnit alloc] initWithAdUnitId:criteoBannerAdUnitId size:CGSizeMake(320, 50)];
    }
    return criteoBannerAdUnit;
}

+ (CRInterstitialAdUnit *)criteoInterstitialAdUnit {
    if (criteoInterstitialAdUnit == NULL) {
        criteoInterstitialAdUnit = [[CRInterstitialAdUnit alloc] initWithAdUnitId:criteoInterstitialAdUnitId];
    }
    return criteoInterstitialAdUnit;
}

@end
