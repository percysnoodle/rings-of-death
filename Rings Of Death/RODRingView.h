//
//  RODRingView.h
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RODRing.h"

@interface RODRingView : UIView

@property (nonatomic, strong, readonly) RODRing *ring;
- (instancetype)initWithFrame:(CGRect)frame ring:(RODRing *)ring;

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *shadowColor;

@property (nonatomic, assign) CGFloat progress;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
