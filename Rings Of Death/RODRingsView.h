//
//  RODProgressView.h
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RODRing.h"

@class RODRingsView;

@protocol RODRingsViewDelegate <NSObject, UIScrollViewDelegate>

- (NSInteger)numberOfRingsInRingsView:(RODRingsView *)ringsView;
- (RODRing *)ringsView:(RODRingsView *)ringsView ringAtIndex:(NSInteger)index;
- (CGFloat)ringsView:(RODRingsView *)ringsView progressForRingAtIndex:(NSInteger)index;

@end

@interface RODRingsView : UIScrollView

@property (nonatomic, weak) id<RODRingsViewDelegate> delegate;

- (void)reloadData;
- (void)reloadRingAtIndex:(NSInteger)index animated:(BOOL)animated;

@end
