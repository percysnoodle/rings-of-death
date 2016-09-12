//
//  RODProgressView.m
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import "RODRingsView.h"
#import "RODRingView.h"

@interface RODRingsView ()

@property (nonatomic, readonly) NSMutableArray *ringViews;

@end

@implementation RODRingsView

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _ringViews = [NSMutableArray array];
    }
    return self;
}

- (CGRect)frameForRing:(RODRing *)ring
{
    CGRect contentFrame = UIEdgeInsetsInsetRect(self.bounds, self.contentInset);
    
    CGFloat width = contentFrame.size.width, height = contentFrame.size.height;
    CGFloat breadth = MIN(width, height) - 20;
    
    CGRect ringsFrame = CGRectMake((width - breadth) / 2, (height - breadth) / 2, breadth, breadth);
    
    CGRect ringFrame = ring.relativeFrame;
    ringFrame.size.width *= ringsFrame.size.width;
    ringFrame.origin.x *= ringsFrame.size.width;
    ringFrame.origin.x += ringsFrame.origin.x;
    ringFrame.size.height *= ringsFrame.size.height;
    ringFrame.origin.y *= ringsFrame.size.height;
    ringFrame.origin.y += ringsFrame.origin.y;
    return ringFrame;
}

- (void)layoutSubviews
{
    for (RODRingView *ringView in self.ringViews)
    {
        ringView.frame = [self frameForRing:ringView.ring];
    }
}

- (void)reloadData
{
    NSArray *oldRingViews = [NSArray arrayWithArray:self.ringViews];
    for (UIView *oldRingView in oldRingViews)
    {
        [oldRingView removeFromSuperview];
    }
    
    NSInteger numberOfRings = [self.delegate numberOfRingsInRingsView:self];
    for (NSInteger index = 0; index < numberOfRings; index++)
    {
        RODRing *ring = [self.delegate ringsView:self ringAtIndex:index];
        CGRect frame = [self frameForRing:ring];
        RODRingView *ringView = [[RODRingView alloc] initWithFrame:frame ring:ring];
        ringView.progress = [self.delegate ringsView:self progressForRingAtIndex:index];
        [self.ringViews addObject:ringView];
        [self addSubview:ringView];
    }
}

- (void)reloadRingAtIndex:(NSInteger)index animated:(BOOL)animated
{
    RODRingView *ringView = self.ringViews[index];
    CGFloat progress = [self.delegate ringsView:self progressForRingAtIndex:index];
    [ringView setProgress:progress animated:animated];
}

@end
