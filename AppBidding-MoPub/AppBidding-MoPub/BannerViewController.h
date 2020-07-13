//
//  BannerViewController.h
//  AppBidding-MoPub
//
//  Created by Abdoul Guisset on 6/30/20.
//  Copyright © 2020 Abdoul. All rights reserved.
//

#ifndef BannerViewController_h
#define BannerViewController_h

#import "MPAdView.h"
#import <UIKit/UIKit.h>

@interface BannerViewController : UIViewController <MPAdViewDelegate>

@property (nonatomic, strong) MPAdView *adView;
@end

#endif /* BannerViewController_h */
