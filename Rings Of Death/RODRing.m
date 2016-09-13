//
//  RODRing.m
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import "RODRing.h"

@implementation RODRing

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _bodyColor = [UIColor lightGrayColor];
        _headColor = [UIColor whiteColor];
        _relativeFrame = CGRectMake(0, 0, 1, 1);
        
        _shadowProportion = 0.25;
    }
    return self;
}

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end

@implementation RODCircleRing

- (instancetype)initWithRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth
{
    self = [super init];
    if (self)
    {
        _radius = radius;
        _lineWidth = lineWidth;
    }
    return self;
}

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0.5, 0.5)
                                                              radius:self.radius
                                                          startAngle:3 * M_PI / 2
                                                            endAngle:3 * M_PI / 2 + 2 * windingNumber * M_PI
                                                           clockwise:YES];
    
    bezierPath.lineWidth = self.lineWidth;
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    return bezierPath;
}

@end

@implementation RODStarRing

- (instancetype)initWithOuterRadius:(CGFloat)outerRadius innerRadius:(CGFloat)innerRadius lineWidth:(CGFloat)lineWidth
{
    self = [super init];
    if (self)
    {
        _outerRadius = outerRadius;
        _innerRadius = innerRadius;
        _lineWidth = lineWidth;
    }
    return self;
}

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(0.5, 0.5 - self.outerRadius)];
    
    for (int i = 0; i < windingNumber; i++)
    {
        for (int j = 1; j <= 5; j++)
        {
            CGFloat x1 = 0.5 + self.innerRadius * sin((j - 0.5) * 2 * M_PI / 5);
            CGFloat y1 = 0.5 - self.innerRadius * cos((j - 0.5) * 2 * M_PI / 5);
            
            [bezierPath addLineToPoint:CGPointMake(x1, y1)];
            
            CGFloat x2 = 0.5 + self.outerRadius * sin(j * 2 * M_PI / 5);
            CGFloat y2 = 0.5 - self.outerRadius * cos(j * 2 * M_PI / 5);
            
            [bezierPath addLineToPoint:CGPointMake(x2, y2)];
        }
    }
    
    bezierPath.lineWidth = self.lineWidth;
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinMiter;
    
    return bezierPath;
}

@end

@implementation RODHeartRing

- (instancetype)initWithInset:(CGFloat)inset lineWidth:(CGFloat)lineWidth
{
    self = [super init];
    if (self)
    {
        _inset = inset;
        _lineWidth = lineWidth;
    }
    return self;
}

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(0.5, 0.5 - M_SQRT2/4 + self.inset * M_SQRT2)];
    
    for (int i = 0; i < windingNumber; i++)
    {
        [bezierPath addArcWithCenter:CGPointMake(0.5 + M_SQRT2/8, 0.5 - M_SQRT2/8)
                              radius:0.25 - self.inset
                          startAngle:5 * M_PI / 4
                            endAngle:9 * M_PI / 4
                           clockwise:YES];
        
        [bezierPath addLineToPoint:CGPointMake(0.5, 0.5 + M_SQRT2/4 - self.inset * M_SQRT2)];
        
        [bezierPath addArcWithCenter:CGPointMake(0.5 - M_SQRT2/8, 0.5 - M_SQRT2/8)
                              radius:0.25 - self.inset
                          startAngle:3 * M_PI / 4
                            endAngle:7 * M_PI / 4
                           clockwise:YES];
        
        [bezierPath addLineToPoint:CGPointMake(0.5, 0.5 - M_SQRT2/4 + self.inset * M_SQRT2)];
    }
    
    bezierPath.lineWidth = self.lineWidth;
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinMiter;
    
    return bezierPath;
}

@end

@implementation RODSkullRing

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0.5, 0.05)];
    
    for (int i = 0; i < windingNumber; i++)
    {
        [bezierPath addArcWithCenter:CGPointMake(0.5, 0.5)
                              radius:0.45
                          startAngle:3 * M_PI / 2
                            endAngle:2 * M_PI
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.8, 0.5)
                              radius:0.15
                          startAngle:0
                            endAngle:M_PI_2
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.7, 0.9)
                              radius:0.1
                          startAngle:0
                            endAngle:M_PI
                           clockwise:YES];
        
        [bezierPath addLineToPoint:CGPointMake(0.6, 0.8)];
        [bezierPath addLineToPoint:CGPointMake(0.6, 0.9)];
        
        [bezierPath addArcWithCenter:CGPointMake(0.5, 0.9)
                              radius:0.1
                          startAngle:0
                            endAngle:M_PI
                           clockwise:YES];
        
        [bezierPath addLineToPoint:CGPointMake(0.4, 0.8)];
        [bezierPath addLineToPoint:CGPointMake(0.4, 0.9)];
        
        [bezierPath addArcWithCenter:CGPointMake(0.3, 0.9)
                              radius:0.1
                          startAngle:0
                            endAngle:M_PI
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.2, 0.5)
                              radius:0.15
                          startAngle:M_PI_2
                            endAngle:M_PI
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.5, 0.5)
                              radius:0.45
                          startAngle:M_PI
                            endAngle:3 * M_PI / 2
                           clockwise:YES];
    }
    
    bezierPath.lineWidth = 0.1;
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    return bezierPath;
}

@end

@implementation RODPentagramRing

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.shadowProportion = 0.15;
    }
    return self;
}

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0.5, 0.95)];
    
    for (int i = 0; i < windingNumber; i++)
    {
        for (int j = 1; j <= 5; j++)
        {
            CGFloat x = 0.5 + 0.45 * sin(j * 4 * M_PI / 5);
            CGFloat y = 0.5 + 0.45 * cos(j * 4 * M_PI / 5);
            
            [bezierPath addLineToPoint:CGPointMake(x, y)];
        }
    }
    
    bezierPath.lineWidth = 0.1;
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    return bezierPath;
}

@end

@implementation RODHornsRing

- (instancetype)initWithFlip:(BOOL)flip
{
    self = [super init];
    if (self)
    {
        _flip = flip;
    }
    return self;
}

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0.35, 0.6)];
    
    for (int i = 0; i < windingNumber; i++)
    {
        [bezierPath addArcWithCenter:CGPointMake(0.425, 0.2)
                              radius:0.075
                          startAngle:M_PI
                            endAngle:2 * M_PI
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.575, 0.5)
                              radius:0.075
                          startAngle:M_PI
                            endAngle:2 * M_PI
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.725, 0.5)
                              radius:0.075
                          startAngle:M_PI
                            endAngle:2 * M_PI
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.875, 0.2)
                              radius:0.075
                          startAngle:M_PI
                            endAngle:2 * M_PI
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.65, 0.45)
                              radius:0.3 * M_SQRT2
                          startAngle:M_PI_4
                            endAngle:3 * M_PI_4
                           clockwise:YES];
        
        [bezierPath addArcWithCenter:CGPointMake(0.125, 0.525)
                              radius:0.075 * M_SQRT2
                          startAngle:5 * M_PI_4
                            endAngle:7 * M_PI_4
                           clockwise:YES];
        
        [bezierPath addLineToPoint:CGPointMake(0.35, 0.6)];
    }
    
    bezierPath.lineWidth = 0.1;
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    if (self.flip)
    {
        CGAffineTransform transform = CGAffineTransformMakeScale(-1, 1);
        transform = CGAffineTransformTranslate(transform, -1, 0);
        
        [bezierPath applyTransform:transform];
    }
    
    return bezierPath;
}

@end
