//
//  BannerViewController.m
//  Standalone
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
#import <CriteoPublisherSdk/CriteoPublisherSdk.h>


@interface BannerViewController () <CRBannerViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *standaloneBannerView;
@property (nonatomic, strong) CRBannerView *bannerView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize banner View with banner ad unit.
    self.bannerView = [[CRBannerView alloc] initWithAdUnit:[AdConfigurations criteoBannerAdUnit]];
    
    self.bannerView.delegate = self;
    
    // Load the bannerView with ad.
    [self.bannerView loadAd];
    
    [self.standaloneBannerView addSubview:self.bannerView];
}

// implementing the delegate methods
// Invoked when the bannerView is loaded with an ad
- (void)bannerDidReceiveAd:(CRBannerView *)bannerView {
    [self.standaloneBannerView addSubview:self.bannerView];
}

// Invoked when the bannerView fails to load. The error description gives further details on the failure.
- (void)banner:(CRBannerView *)bannerView didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"%@", error);
}


@end
