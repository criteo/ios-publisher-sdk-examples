//
//  InterstitialViewController.m
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
