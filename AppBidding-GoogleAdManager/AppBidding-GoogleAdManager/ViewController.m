//
//  ViewController.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
//

#import "ViewController.h"
#import "AdConfigurations.h"
@import GoogleMobileAds;
@import CriteoPublisherSdk;

@interface ViewController ()

@property(nonatomic, strong) IBOutlet DFPBannerView *bannerView;
@property(nonatomic, strong) DFPInterstitial *interstitial;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bannerView.adUnitID = [AdConfigurations gamBannerAdUnitId];
    self.bannerView.rootViewController = self;
    self.bannerView.adSize = kGADAdSizeSmartBannerPortrait;

    self.interstitial = [self createAndLoadInterstitialWithAdUnitId:[AdConfigurations gamInterstitialAdUnitId]];
}

- (IBAction)displayBanner {
    DFPRequest *request = [DFPRequest request];

    [[Criteo sharedCriteo] setBidsForRequest:request withAdUnit:[AdConfigurations criteoBannerAdUnit]];

    [self.bannerView loadRequest:request];
}

- (DFPInterstitial *)createAndLoadInterstitialWithAdUnitId:(NSString *)adUnitId {
    DFPInterstitial *interstitial = [[DFPInterstitial alloc] initWithAdUnitID:adUnitId];
    DFPRequest *request = [DFPRequest request];

    [[Criteo sharedCriteo] setBidsForRequest:request withAdUnit:[AdConfigurations criteoInterstitialAdUnit]];

    [interstitial loadRequest:request];
    return interstitial;
}

- (IBAction)displayInterstitial {
    if (self.interstitial.isReady) {
      [self.interstitial presentFromRootViewController:self];
    }
}

@end
