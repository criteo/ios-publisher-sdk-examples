//
//  InterstitialViewController.h
//  AppBidding-MoPub
//
//  Copyright © 2020 Criteo. All rights reserved.
//


#import "MPInterstitialAdController.h"


NS_ASSUME_NONNULL_BEGIN

@interface InterstitialViewController : UIViewController <MPInterstitialAdControllerDelegate>
@property (nonatomic, retain) MPInterstitialAdController *interstitial;

@end

NS_ASSUME_NONNULL_END
