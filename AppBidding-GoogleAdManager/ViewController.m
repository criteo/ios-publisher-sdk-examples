//
//  ViewController.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAds;

static NSString *const gamBannerAdUnitId = @"/6499/example/banner";
static NSString *const gamInterstitialAdUnitId = @"/6499/example/interstitial";

@interface ViewController ()

@property(nonatomic, strong) IBOutlet DFPBannerView *bannerView;
@property(nonatomic, strong) DFPInterstitial *interstitial;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bannerView.adUnitID = gamBannerAdUnitId;
    self.bannerView.rootViewController = self;
    self.bannerView.adSize = kGADAdSizeSmartBannerPortrait;

    self.interstitial = [self createAndLoadInterstitialWithAdUnitId:gamInterstitialAdUnitId];
}

- (IBAction)displayBanner {
    [self.bannerView loadRequest:[DFPRequest request]];
}

- (DFPInterstitial *)createAndLoadInterstitialWithAdUnitId:(NSString *)adUnitId {
    DFPInterstitial *interstitial = [[DFPInterstitial alloc] initWithAdUnitID:adUnitId];
    [interstitial loadRequest:[DFPRequest request]];
    return interstitial;
}

- (IBAction)displayInterstitial {
    if (self.interstitial.isReady) {
      [self.interstitial presentFromRootViewController:self];
    }
}

@end
