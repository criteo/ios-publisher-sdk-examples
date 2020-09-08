//
//  NativeSampleTableViewController.m
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

#import "NativeTableViewController.h"
#import "AdConfigurations.h"

static const NSUInteger nativeAdIndex = 3;
static const NSUInteger cellHeight = 140;

@interface NativeTableViewController () <CRNativeLoaderDelegate>

@property (strong, nonatomic) NSMutableArray *tableViewItems;
@property (strong, nonatomic) CRNativeLoader *nativeLoader;

@end

@implementation NativeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewItems = [[NSMutableArray alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ContentItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"contentCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"NativeAdTableViewCell" bundle:nil] forCellReuseIdentifier:@"nativeAdCell"];
    
    [self addContent];
    [self addNativeAd];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tableViewItems[indexPath.row] isKindOfClass:[CRNativeAd class]]) {
        CRNativeAd *ad = self.tableViewItems[indexPath.row];
        NativeAdTableViewCell *nativeAdCell = [self.tableView dequeueReusableCellWithIdentifier:@"nativeAdCell" forIndexPath:indexPath];
        nativeAdCell.nativeAdView.nativeAd = ad;
        nativeAdCell.titleLabel.text = ad.title;
        nativeAdCell.descriptionLabel.text = ad.body;
        nativeAdCell.productMediaView.mediaContent = ad.productMedia;
        nativeAdCell.attributionLabel.text = [NSString stringWithFormat:@"Ads by %@", ad.advertiserDomain];
        [nativeAdCell.clickToActionButton setTitle:ad.callToAction forState:UIControlStateNormal];
        nativeAdCell.clickToActionButton.userInteractionEnabled = NO;
        return nativeAdCell;
    } else {
        ContentItem *item = self.tableViewItems[indexPath.row];
        ContentItemTableViewCell *contentItemCell = [self.tableView dequeueReusableCellWithIdentifier:@"contentCell" forIndexPath:indexPath];
        contentItemCell.titleLabel.text = item.contentTitle;
        contentItemCell.descriptionLabel.text = item.contentDescription;
        contentItemCell.contentImage.image = item.contentImage;
        return contentItemCell;
    }
}

- (void)addContent {
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img.icons8.com/cotton/2x/news.png"]]];
    for (int i = 0; i < 10; i++) {
        ContentItem *item = [[ContentItem alloc] init];
        item.contentTitle = [NSString stringWithFormat:@"%d. Lorem ipsum dolor sit amet", i + 1];
        item.contentDescription = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elementum augue dignissim mi ullamcorper cursus. Nulla varius vulputate elit. Nullam..";
        item.contentImage = image;
        [self.tableViewItems addObject:item];
    }
}

- (void)addNativeAd {
    self.nativeLoader = [[CRNativeLoader alloc] initWithAdUnit:[AdConfigurations criteoNativeAdUnit]];
    self.nativeLoader.delegate = self;
    [self.nativeLoader loadAd];
}

#pragma mark - CRNativeDelegate
// Invoked when the native ad is loaded
// You will need to define your native view here
- (void)nativeLoader:(CRNativeLoader *)loader didReceiveAd:(CRNativeAd *)ad {
    [self.tableViewItems insertObject:ad atIndex:nativeAdIndex];
    [self.tableView reloadData];
}

// Invoked when the native ad fails to load. The error description gives further details on the failure.
- (void)nativeLoader:(CRNativeLoader *)loader didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Failed to recevie an ad: %@", error);
}

// Invoked when the user clicks on the native ad
- (void)nativeLoaderDidDetectClick:(CRNativeLoader *)loader {

}

// Invoked when the native ad is visible on the screen. Please refer to the documentations.
- (void)nativeLoaderDidDetectImpression:(CRNativeLoader *)loader {

}

// Invoked when the user leaves application on click the native ad
- (void)nativeLoaderWillLeaveApplication:(CRNativeLoader *)loader {

}
       
@end
