//  Copyright © 2018-2020 Criteo. All rights reserved.
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
//  InterstitialViewController.m
//  AppBidding-MoPub
//
//  Copyright © 2020 Criteo. All rights reserved.
//


#import "InterstitialViewController.h"
#import "AdConfigurations.h"
@import CriteoPublisherSdk;

@interface InterstitialViewController ()
@property (weak, nonatomic) IBOutlet UIButton *displayInterstitialButton;

@end


@implementation InterstitialViewController


- (void) viewDidLoad {
    [super viewDidLoad];
    
    // Instantiate the interstitial using the class convenience method.
    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:[AdConfigurations mopubInterstitialAdUnitId]];
    
    self.interstitial.delegate = self;
    [self loadInterstitial];
}


- (void)loadInterstitial {
    // add criteo
    [[Criteo sharedCriteo] setBidsForRequest:self.interstitial withAdUnit:[AdConfigurations criteoInterstitialAdUnit]];

    // Fetch the interstitial ad.
    [self.interstitial loadAd];
}

- (IBAction)displayInterstitial {
    
    if(self.interstitial.ready) {
        // Ad loaded; play the ad
        [self.interstitial showFromViewController:self];
        self.displayInterstitialButton.enabled = NO;
    }
    
}

//if pre fetch successfully
-(void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    
    self.displayInterstitialButton.enabled = YES;
    [self.displayInterstitialButton setTitle:@"Display Interstitial" forState:UIControlStateNormal];
    
}


-(void)interstitialDidFailToLoadAd:(MPInterstitialAdController *)interstitial withError:(NSError *)error {
    self.displayInterstitialButton.enabled = NO;
    [self.displayInterstitialButton setTitle:@"Ad Failed to Load" forState:UIControlStateNormal];
}
@end
