//
//  BannerViewController.m
//  AppBidding-GoogleAdManager
//
//  Copyright © 2020 Criteo. All rights reserved.
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
