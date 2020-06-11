//
//  InterstitialViewController.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
//

#import "InterstitialViewController.h"
#import "AdConfigurations.h"
@import GoogleMobileAds;
@import CriteoPublisherSdk;

@interface InterstitialViewController () <GADInterstitialDelegate>

@property(nonatomic, strong) DFPInterstitial *interstitial;
@property (weak, nonatomic) IBOutlet UIButton *displayInterstitialButton;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.interstitial = [self createAndLoadInterstitialWithAdUnitId:[AdConfigurations gamInterstitialAdUnitId]];
}

- (DFPInterstitial *)createAndLoadInterstitialWithAdUnitId:(NSString *)adUnitId {
    DFPInterstitial *interstitial = [[DFPInterstitial alloc] initWithAdUnitID:adUnitId];
    DFPRequest *request = [DFPRequest request];
    interstitial.delegate = self;

    [[Criteo sharedCriteo] setBidsForRequest:request withAdUnit:[AdConfigurations criteoInterstitialAdUnit]];

    [interstitial loadRequest:request];
    return interstitial;
}

- (IBAction)displayInterstitial {
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
        self.displayInterstitialButton.enabled = NO;
    }
}

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    self.displayInterstitialButton.enabled = YES;
    [self.displayInterstitialButton setTitle:@"Display Interstitial" forState:UIControlStateNormal];
}

- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    self.displayInterstitialButton.enabled = NO;
    [self.displayInterstitialButton setTitle:@"Ad Failed to Load" forState:UIControlStateNormal];
}

@end
