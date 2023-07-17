//
//  InterstitialViewController.m
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

#import "InterstitialViewController.h"
#import "AdConfigurations.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <CriteoPublisherSdk/CriteoPublisherSdk.h>

@interface InterstitialViewController () <GADFullScreenContentDelegate>

@property(nonatomic, strong) GAMInterstitialAd *interstitial;
@property (weak, nonatomic) IBOutlet UIButton *displayInterstitialButton;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[Criteo sharedCriteo] loadBidForAdUnit:[AdConfigurations criteoInterstitialAdUnit] responseHandler:^(CRBid *bid) {
        // existing Ad Manager request
            GAMRequest *request = [GAMRequest request];

            if (bid != nil) {
                // add Criteo bids into Ad Manager request
                [[Criteo sharedCriteo] enrichAdObject:request withBid:bid];
            }

            // load Interstitial ad
        [GAMInterstitialAd loadWithAdManagerAdUnitID:[AdConfigurations gamInterstitialAdUnitId]
                                             request:request
                                   completionHandler:^(GAMInterstitialAd *ad, NSError *error) {
          if (error) {
            NSLog(@"criteoSDK Failed to load interstitial ad with error: %@", [error localizedDescription]);
            return;
          }
          self.interstitial = ad;
          self.interstitial.fullScreenContentDelegate = self;
        }];
    }];
}

- (IBAction)displayInterstitial {
    
    if (self.interstitial) {
        [self.interstitial presentFromRootViewController:self];
        self.displayInterstitialButton.enabled = NO;
      } else {
        NSLog(@"Ad wasn't ready");
      }
}

@end
