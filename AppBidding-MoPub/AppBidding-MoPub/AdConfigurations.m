//
//  AdConfigurations.m
//  AppBidding-MoPub
//
//  Created by Abdoul Guisset.
//  Copyright © 2020 Abdoul. All rights reserved.
//

#import "AdConfigurations.h"
@import CriteoPublisherSdk;

// Here we use MoPub test Ad Unit ID in order to demonstrate the integration
// If you'd like to see Criteo banner in action, you need to use your own Ad Unit IDs, with Criteo line items targeting the Ad Units.
// To setup Criteo line items, please refer to https://publisherdocs.criteotilt.com/app/ios/app-bidding/mopub/#ad-server-setup

static NSString* const mopubBannerAdUnitId = @"0ac59b0996d947309c33f59d6676399f";
static NSString* const mopubInterstitialAdUnitId = @"4f117153f5c24fa6a3a92b818a5eb630";

// This is a test Criteo Publisher ID that works for this sample app
// In your application, update this value with your own Criteo Publisher ID
static NSString* const criteoPublisherId = @"B-000000";

// Here we use test Criteo Ad Unit IDs in order to return test ads
// In your application, Criteo Ad Unit IDs are typically the same as your MoPub's Ad Unit ID
static NSString* const criteoBannerAdUnitId = @"30s6zt3ayypfyemwjvmp";
static NSString* const criteoInterstitialAdUnitId = @"6yws53jyfjgoq1ghnuqb";

static CRBannerAdUnit *criteoBannerAdUnit;
static CRInterstitialAdUnit *criteoInterstitialAdUnit;


@implementation AdConfigurations

# pragma mark - MoPub

+ (NSString *)mopubBannerAdUnitId {
    return mopubBannerAdUnitId;
}

+ (NSString *)mopubInterstitialAdUnitId {
    return mopubInterstitialAdUnitId;
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