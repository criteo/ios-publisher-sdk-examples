//
//  CriteoSample.m
//  AppBidding-MoPub
//
//  Copyright © 2020 Criteo. All rights reserved.
//



#import "CriteoSample.h"

@implementation CriteoSample

- (id) initWithLabel:(NSString *)label AndSegueId:(NSString *)segueId {
    self = [super init];
    if (self) {
        self.label = label;
        self.segueId = segueId;
    }
    return self;
}

@end
