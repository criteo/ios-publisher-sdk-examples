//
//  BannerViewController.m
//  AppBidding-MoPub
//
//  Copyright © 2020 Criteo. All rights reserved.
//


#import "BannerViewController.h"
#import "AdConfigurations.h"
@import CriteoPublisherSdk;

@interface BannerViewController ()

@end

@implementation BannerViewController


// safeAreaInsets will be 0 if executed in viewDidLoad
- (void)viewDidAppear:(BOOL)animated {

    // Do any additional setup after loading the view.
    self.adView = [[MPAdView alloc] initWithAdUnitId:[AdConfigurations mopubBannerAdUnitId]];
    self.adView.delegate = self;
    self.adView.frame = CGRectMake(0, self.view.frame.size.height - self.view.safeAreaInsets.bottom - 50, self.view.frame.size.width, 50);
    [self.view addSubview:self.adView];

    // add Criteo bids into MoPub Ad View object
    [[Criteo sharedCriteo] setBidsForRequest:self.adView withAdUnit:[AdConfigurations criteoBannerAdUnit]];

    [self.adView loadAd]; // since the size is known in advance
}

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}


@end


