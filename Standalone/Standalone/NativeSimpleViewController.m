//
//  NativeSimpleViewController.m
//  Standalone
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

#import "NativeSimpleViewController.h"
#import "AdConfigurations.h"
#import <CriteoPublisherSdk/CriteoPublisherSdk.h>

@interface NativeSimpleViewController () <CRNativeLoaderDelegate>

@property (nonatomic, strong) CriteoNativeAdView *nativeAdView;
@property (nonatomic, strong) CRNativeLoader *nativeLoader;

@end

@implementation NativeSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nativeLoader = [[CRNativeLoader alloc] initWithAdUnit:[AdConfigurations criteoNativeAdUnit]];
    self.nativeLoader.delegate = self;
    [self.nativeLoader loadAd];
}

// Invoked when the native ad is loaded
// You will need to define your native view here
- (void)nativeLoader:(CRNativeLoader *)loader didReceiveAd:(CRNativeAd *)ad {
    // load native ad view from xib file
    self.nativeAdView = [[NSBundle mainBundle] loadNibNamed:@"CriteoNativeAdView"
            owner:nil options:nil].firstObject;

    // set the native ad
    self.nativeAdView.nativeAd = ad;

    // fill the elements with native assets
    self.nativeAdView.titleLabel.text = ad.title;
    self.nativeAdView.descriptionLabel.text = ad.body;
    self.nativeAdView.productMedia.mediaContent = ad.productMedia;
    self.nativeAdView.attributionLabel.text =
        [NSString stringWithFormat:@"Ads by %@", ad.advertiserDomain];
    [self.nativeAdView.clickToActionButton setTitle:ad.callToAction
                                    forState:UIControlStateNormal];
    self.nativeAdView.clickToActionButton.userInteractionEnabled = NO;

    // add the native view into the placeholder
    [self.nativePlaceholder addSubview:self.nativeAdView];
}

// Invoked when the native ad fails to load. The error description gives further details on the failure.
- (void)nativeLoader:(CRNativeLoader *)loader didFailToReceiveAdWithError:(NSError *)error {

}

// Invoked when the user clicks on the native ad
- (void)nativeLoaderDidDetectClick:(CRNativeLoader *)loader {

}

// Invoked when at least 1px of the native ad is visible on the screen
- (void)nativeLoaderDidDetectImpression:(CRNativeLoader *)loader {
    
}

// Invoked when the user leaves application on click the native ad
- (void)nativeLoaderWillLeaveApplication:(CRNativeLoader *)loader {
    
}

@end
