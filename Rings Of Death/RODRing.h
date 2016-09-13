//
//  RODRing.h
//  Rings Of Death
//
//  Created by Simon Booth on 11/09/2016.
//  Copyright © 2016 percysnoodle.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RODRing : NSObject

- (UIBezierPath *)bezierPathWithWindingNumber:(NSInteger)windingNumber;

@property (nonatomic, strong) UIColor *bodyColor;
@property (nonatomic, strong) UIColor *headColor;
@property (nonatomic, assign) CGRect relativeFrame;

@property (nonatomic, assign) CGFloat shadowProportion;


@end

@interface RODCircleRing : RODRing

@property (nonatomic, assign, readonly) CGFloat radius;
@property (nonatomic, assign, readonly) CGFloat lineWidth;

- (instancetype)initWithRadius:(CGFloat)radius lineWidth:(CGFloat)lineWidth;

@end

@interface RODStarRing : RODRing

@property (nonatomic, assign, readonly) CGFloat outerRadius;
@property (nonatomic, assign, readonly) CGFloat innerRadius;
@property (nonatomic, assign, readonly) CGFloat lineWidth;

- (instancetype)initWithOuterRadius:(CGFloat)outerRadius innerRadius:(CGFloat)innerRadius lineWidth:(CGFloat)lineWidth;

@end

@interface RODHeartRing : RODRing

@property (nonatomic, assign, readonly) CGFloat inset;
@property (nonatomic, assign, readonly) CGFloat lineWidth;

- (instancetype)initWithInset:(CGFloat)inset lineWidth:(CGFloat)lineWidth;

@end

@interface RODSkullRing : RODRing

@end

@interface RODPentagramRing : RODRing

@end

@interface RODHornsRing : RODRing

@property (nonatomic, assign, readonly) BOOL flip;
- (instancetype)initWithFlip:(BOOL)flip;

@end