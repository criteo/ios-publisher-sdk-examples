//
//  BannerViewController.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2023 Criteo. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "BannerViewController.h"
#import "AdConfigurations.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <CriteoPublisherSdk/CriteoPublisherSdk.h>

@interface BannerViewController () <GADBannerViewDelegate>

@property(nonatomic, strong) GAMBannerView *bannerView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // In this case, we instantiate the banner with desired ad size.
    self.bannerView = [[GAMBannerView alloc]
                       initWithAdSize:GADAdSizeBanner];
    
    self.bannerView.adUnitID = [AdConfigurations gamBannerAdUnitId];
    self.bannerView.rootViewController = self;
    self.bannerView.delegate = self;
    
    [self displayBanner:self.bannerView];
}

- (void)displayBanner:(UIView *)bannerView {
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
        [NSLayoutConstraint constraintWithItem:bannerView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view.safeAreaLayoutGuide
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:bannerView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0]
    ]];
    
    [[Criteo sharedCriteo] loadBidForAdUnit:[AdConfigurations criteoBannerAdUnit] responseHandler:^(CRBid *bid) {
        // existing Ad Manager request
        GAMRequest *request = [GAMRequest request];
        
        if (bid != nil) {
            // add Criteo bids into Ad Manager request
            [[Criteo sharedCriteo] enrichAdObject:request withBid:bid];
        }
        // load Banner ad
        [self.bannerView loadRequest:request];
    }];
}

- (void)bannerViewDidReceiveAd:(GADBannerView *)bannerView {
  NSLog(@"criteoSDK Ad loaded.");
}

- (void)bannerView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(NSError *)error {
  NSLog(@"criteoSDK Failed to load ad with error: %@", [error localizedDescription]);
}
@end
