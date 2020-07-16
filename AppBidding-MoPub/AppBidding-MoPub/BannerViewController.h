//
//  BannerViewController.h
//  AppBidding-MoPub
//
//  Copyright © 2020 Criteo. All rights reserved.
//


#ifndef BannerViewController_h
#define BannerViewController_h

#import "MPAdView.h"
#import <UIKit/UIKit.h>

@interface BannerViewController : UIViewController <MPAdViewDelegate>

@property (nonatomic, strong) MPAdView *adView;
@end

#endif /* BannerViewController_h */
