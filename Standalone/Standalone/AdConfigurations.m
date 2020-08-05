//
//  AdConfigurations.m
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

#import "AdConfigurations.h"
#import <CriteoPublisherSdk/CriteoPublisherSdk.h>

// This is a test Criteo Publisher ID that works for this sample app
// In your application, update this value with your own Criteo Publisher ID
static NSString* const criteoPublisherId = @"B-000000";

// Here we use test Criteo Ad Unit IDs in order to return test ads
static NSString* const criteoBannerAdUnitId = @"30s6zt3ayypfyemwjvmp";

static CRBannerAdUnit *criteoBannerAdUnit;

@implementation AdConfigurations

# pragma mark - Criteo

+ (NSString *)criteoPublisherId {
    return criteoPublisherId;
}

+ (CRBannerAdUnit *)criteoBannerAdUnit {
    if (criteoBannerAdUnit == NULL) {
        criteoBannerAdUnit = [[CRBannerAdUnit alloc] initWithAdUnitId:criteoBannerAdUnitId size:CGSizeMake(320, 50)];
    }
    return criteoBannerAdUnit;
}

@end
