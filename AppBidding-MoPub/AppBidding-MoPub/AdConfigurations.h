//
//  AdConfigurations.h
//  AppBidding-MoPub
//
//  Created by Abdoul Guisset.
//  Copyright © 2020 Abdoul. All rights reserved.
//
#import <Foundation/Foundation.h>
@import CriteoPublisherSdk;

NS_ASSUME_NONNULL_BEGIN

@interface AdConfigurations : NSObject

# pragma mark - MoPub

+ (NSString*) mopubBannerAdUnitId;
+ (NSString*) mopubInterstitialAdUnitId;

# pragma mark - Criteo

+ (NSString*) criteoPublisherId;
+ (CRBannerAdUnit *)criteoBannerAdUnit;
+ (CRInterstitialAdUnit *)criteoInterstitialAdUnit;

@end

NS_ASSUME_NONNULL_END
