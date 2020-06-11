//
//  BannerViewController.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
//

#import "BannerViewController.h"
#import "AdConfigurations.h"
@import GoogleMobileAds;
@import CriteoPublisherSdk;

@interface BannerViewController ()

@property(nonatomic, strong) IBOutlet DFPBannerView *bannerView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bannerView.adUnitID = [AdConfigurations gamBannerAdUnitId];
    self.bannerView.rootViewController = self;
    self.bannerView.adSize = kGADAdSizeSmartBannerPortrait;

    [self displayBanner];
}

- (void)displayBanner {
    DFPRequest *request = [DFPRequest request];

    [[Criteo sharedCriteo] setBidsForRequest:request withAdUnit:[AdConfigurations criteoBannerAdUnit]];

    [self.bannerView loadRequest:request];
}

@end
