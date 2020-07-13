//
//  InterstitialViewController.h
//  AppBidding-MoPub
//
//  Created by Abdoul Guisset on 6/29/20.
//  Copyright © 2020 Abdoul. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "MPAdView.h"
#import "MPInterstitialAdController.h"


NS_ASSUME_NONNULL_BEGIN

@interface InterstitialViewController : UIViewController <MPInterstitialAdControllerDelegate>
@property (nonatomic, retain) MPInterstitialAdController *interstitial;

@end

NS_ASSUME_NONNULL_END
