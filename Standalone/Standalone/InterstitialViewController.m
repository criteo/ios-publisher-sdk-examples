//
//  InterstitialViewController.m
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

#import "InterstitialViewController.h"
#import "AdConfigurations.h"
#import <CriteoPublisherSdk/CriteoPublisherSdk.h>

@interface InterstitialViewController () <CRInterstitialDelegate>

@property (nonatomic, strong) CRInterstitial *interstitial;
@property (weak, nonatomic) IBOutlet UIButton *displayInterstitialButton;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize interstitial with interstitial ad unit
    self.interstitial = [[CRInterstitial alloc] initWithAdUnit:[AdConfigurations criteoInterstitialAdUnit]];
    self.interstitial.delegate = self;
    [self.interstitial loadAd];
}

- (IBAction)displayInterstitial {

    if (self.interstitial.isAdLoaded) {
        [self.interstitial presentFromRootViewController:self];
        self.displayInterstitialButton.enabled = NO;
    }
}

// Invoked when interstitial ad content has been completely loaded and is ready to be presented. This is an apt place to present the interstitial
- (void)interstitialIsReadyToPresent:(CRInterstitial *)interstitial {
    self.displayInterstitialButton.enabled = YES;
    [self.displayInterstitialButton setTitle:@"Display Interstitial" forState:UIControlStateNormal];
}

- (void)interstitial:(CRInterstitial *)interstitial didFailToReceiveAdWithError:(NSError *)error {
    self.displayInterstitialButton.enabled = NO;
    [self.displayInterstitialButton setTitle:@"Ad Failed to Load" forState:UIControlStateNormal];
}
@end
