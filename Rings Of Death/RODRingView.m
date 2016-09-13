//
//  RODRingView.m
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import "RODRingView.h"
#import <QuartzCore/QuartzCore.h>

#define kNumberOfgradientLayers 32

@interface RODRingView ()

@property (nonatomic, assign) NSInteger windingNumber;

@property (nonatomic, strong, readonly) CAShapeLayer *trackLayer;
@property (nonatomic, strong, readonly) CAShapeLayer *lowerLayer;
@property (nonatomic, strong, readonly) CAShapeLayer *shadowLayer;
@property (nonatomic, strong, readonly) CAShapeLayer *shadowMaskLayer;
@property (nonatomic, strong, readonly) CAShapeLayer *upperLayer;
@property (nonatomic, strong, readonly) NSArray<CAShapeLayer *> *gradientLayers;

@end

@implementation RODRingView

- (instancetype)initWithFrame:(CGRect)frame ring:(nonnull RODRing *)ring
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _ring = ring;
        _windingNumber = 1;
        
        _trackColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        _shadowColor = [UIColor blackColor];
    
        _trackLayer = [[CAShapeLayer alloc] init];
        _trackLayer.fillColor = nil;
        _trackLayer.strokeColor = [_trackColor CGColor];
        [self.layer addSublayer:_trackLayer];
        
        _lowerLayer = [[CAShapeLayer alloc] init];
        _lowerLayer.fillColor = nil;
        _lowerLayer.strokeColor = [ring.bodyColor CGColor];
        [self.layer addSublayer:_lowerLayer];
        
        _shadowLayer = [[CAShapeLayer alloc] init];
        _shadowLayer.fillColor = nil;
        _shadowLayer.strokeColor = [ring.bodyColor CGColor];
        _shadowLayer.shadowOffset = CGSizeMake(0, 0);
        _shadowLayer.shadowOpacity = 0.5;
        _shadowLayer.shadowRadius = 10;
        [self.layer addSublayer:_shadowLayer];
        
        _shadowMaskLayer = [[CAShapeLayer alloc] init];
        _shadowMaskLayer.fillColor = nil;
        _shadowMaskLayer.strokeColor = [[UIColor blackColor] CGColor];
        _shadowLayer.mask = _shadowMaskLayer;
        
        _upperLayer = [[CAShapeLayer alloc] init];
        _upperLayer.fillColor = nil;
        _upperLayer.strokeColor = [ring.bodyColor CGColor];
        [self.layer addSublayer:_upperLayer];
        
        NSMutableArray *gradientLayers = [NSMutableArray array];
        
        for (int i = 0; i < kNumberOfgradientLayers; i++)
        {
            CAShapeLayer *gradientLayer = [[CAShapeLayer alloc] init];
            gradientLayer.fillColor = nil;
            gradientLayer.strokeColor = [ring.headColor CGColor];
            gradientLayer.opacity = 1.0 / kNumberOfgradientLayers;
            [self.layer addSublayer:gradientLayer];
            
            [gradientLayers addObject:gradientLayer];
        }
        
        _gradientLayers = gradientLayers;
    }
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    CGRect frame = layer.bounds;
    UIBezierPath *bezierPath = [self.ring bezierPathWithWindingNumber:self.windingNumber];
    CGPathRef path = [bezierPath CGPath];
    
    CGFloat scaleFactor = MIN(frame.size.width, frame.size.height);
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    CGPathRef scaledPath = CGPathCreateCopyByTransformingPath(path, &transform);
    
    CGFloat lineWidth = bezierPath.lineWidth * scaleFactor;
    NSString *lineCap = nil, *lineJoin = nil;
    
    switch (bezierPath.lineCapStyle)
    {
        case kCGLineCapRound:
            lineCap = kCALineCapRound;
            break;
            
        case kCGLineCapSquare:
            lineCap = kCALineCapSquare;
            break;
            
        case kCGLineCapButt:
            lineCap = kCALineCapButt;
            break;
    }
    
    switch (bezierPath.lineJoinStyle)
    {
        case kCGLineJoinRound:
            lineJoin = kCALineJoinRound;
            break;
            
        case kCGLineJoinBevel:
            lineJoin = kCALineJoinBevel;
            break;
            
        case kCGLineJoinMiter:
            lineJoin = kCGLineJoinMiter;
            break;
    }
    
    CGFloat progress = MAX(self.progress, 0.001);
    CGFloat shadowStart = progress - self.ring.shadowProportion;
    CGFloat upperStart = progress - 2 * self.ring.shadowProportion;
    
    self.trackLayer.frame = frame;
    self.trackLayer.lineCap = lineCap;
    self.trackLayer.lineJoin = lineJoin;
    self.trackLayer.lineWidth = lineWidth;
    self.trackLayer.path = scaledPath;
    self.trackLayer.strokeStart = 0;
    self.trackLayer.strokeEnd = 1;
    
    self.lowerLayer.frame = frame;
    self.lowerLayer.lineCap = lineCap;
    self.lowerLayer.lineJoin = lineJoin;
    self.lowerLayer.lineWidth = lineWidth;
    self.lowerLayer.path = scaledPath;
    self.lowerLayer.strokeStart = 0;
    self.lowerLayer.strokeEnd = progress / self.windingNumber;
    
    self.shadowLayer.frame = frame;
    self.shadowLayer.lineCap = lineCap;
    self.shadowLayer.lineJoin = lineJoin;
    self.shadowLayer.lineWidth = lineWidth;
    self.shadowLayer.path = scaledPath;
    self.shadowLayer.strokeStart = shadowStart / self.windingNumber;
    self.shadowLayer.strokeEnd = progress / self.windingNumber;
    
    self.shadowMaskLayer.frame = frame;
    self.shadowMaskLayer.lineCap = lineCap;
    self.shadowMaskLayer.lineJoin = lineJoin;
    self.shadowMaskLayer.lineWidth = lineWidth;
    self.shadowMaskLayer.path = scaledPath;
    self.shadowMaskLayer.strokeStart = 0;
    self.shadowMaskLayer.strokeEnd = 1;
    
    self.upperLayer.frame = frame;
    self.upperLayer.lineCap = lineCap;
    self.upperLayer.lineJoin = lineJoin;
    self.upperLayer.lineWidth = lineWidth;
    self.upperLayer.path = scaledPath;
    self.upperLayer.strokeStart = upperStart / self.windingNumber;
    self.upperLayer.strokeEnd = progress / self.windingNumber;
    
    
    for (int i = 0; i < kNumberOfgradientLayers; i++)
    {
        CAShapeLayer *gradientLayer = self.gradientLayers[i];
        
        CGFloat proportion = (CGFloat)(kNumberOfgradientLayers - i) / kNumberOfgradientLayers;
        
        gradientLayer.frame = frame;
        gradientLayer.lineCap = lineCap;
        gradientLayer.lineJoin = lineJoin;
        gradientLayer.lineWidth = lineWidth;
        gradientLayer.path = scaledPath;
        gradientLayer.strokeStart = (progress - proportion) / self.windingNumber;
        gradientLayer.strokeEnd = progress / self.windingNumber;
    }
    
    CGPathRelease(scaledPath);
}

- (void)setProgress:(CGFloat)progress
{
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    if (ceil(progress) > self.windingNumber)
    {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        
        self.windingNumber = (int)ceil(progress);
        
        [self setNeedsLayout];
        [self layoutIfNeeded];
        
        [CATransaction commit];
    }
    
    [CATransaction begin];
    
    if (animated)
    {
        CFTimeInterval duration = fabs(progress - _progress);
        if (duration < 0.25)
        {
            duration = 0.25;
        }
    
        [CATransaction setAnimationDuration:duration];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    }
    else
    {
        [CATransaction setDisableActions:YES];
    }
    
    _progress = progress;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    [CATransaction commit];
}

@end
