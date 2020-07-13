//
//  CriteoSample.h
//  AppBidding-MoPub
//
//  Created by Abdoul Guisset.
//  Copyright © 2020 Abdoul. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CriteoSample : NSObject

@property (assign) NSString *label;
@property (assign) NSString *segueId;

- (id) initWithLabel:(NSString*)label AndSegueId:(NSString*)segueId;

@end

NS_ASSUME_NONNULL_END
